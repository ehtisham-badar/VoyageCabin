//
//  APIManager.swift
//  VoyageCabin
//
//  Created by APPLE on 09/05/2025.
//

import Foundation
import UIKit
import SystemConfiguration

enum Environment {
    case development
    case staging
    
    var baseURL: String {
        switch self {
        case .development:
            return "https://api.voyagecabin.com/"
        case .staging:
            return "https://api.voyagecabin.com/"
        }
    }
}

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidData
    case noInternetConnection
}
enum APIResult<T> {
    case success(T)
    case failure(APIError)
}
struct ResultResponse: Codable {
    let result: String?
}


class APIManager {
    private var environment: Environment
    
    private init(environment: Environment = .development) {
        self.environment = environment
    }
    
    func setEnvironment(_ environment: Environment) {
        self.environment = environment
    }
    static let shared = APIManager()
    
    func postData<T: Codable>(endpoint: APIEndpoint, requestBody: Codable, viewController: UIViewController, completion: @escaping (Int?, APIResult<T>) -> Void) {
        guard let url = endpoint.url(baseURL: environment.baseURL) else {
            completion(nil, .failure(.invalidURL))
            return
        }
        
        guard isInternetAvailable() else {
            DispatchQueue.main.async {
                self.showNoInternetAlert(viewController: viewController) {
                    self.postData(endpoint: endpoint, requestBody: requestBody, viewController: viewController, completion: completion)
                }
            }
            completion(nil, .failure(.noInternetConnection))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(nil, .failure(.invalidData))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, .failure(.networkError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .failure(.invalidResponse))
                return
            }
            
            // Check if status code is 200
            if httpResponse.statusCode == 200 {
                // Use a placeholder type for success response without decoding
                if T.self == String.self {
                    if let data = data, let stringResponse = String(data: data, encoding: .utf8) as? T {
                        completion(httpResponse.statusCode, .success(stringResponse))
                    } else {
                        completion(httpResponse.statusCode, .failure(.invalidData))
                    }
                } else {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data!)
                        completion(httpResponse.statusCode, .success(decodedData))
                    } catch {
                        completion(httpResponse.statusCode, .failure(.invalidData))
                    }
                }
                return
            }
            
            // For other status codes, handle as usual
            guard let data = data else {
                completion(httpResponse.statusCode, .failure(.invalidData))
                return
            }
            
            // Print the raw JSON data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(httpResponse.statusCode, .success(decodedData))
            } catch {
                // Print the decoding error
                print("Decoding error: \(error)")
                completion(httpResponse.statusCode, .failure(.invalidData))
            }
        }.resume()
    }
    private func showNoInternetAlert(viewController: UIViewController, retryAction: @escaping () -> Void) {
        let alert = UIAlertController(title: "No Internet Connection", message: "Please check your internet connection and try again.", preferredStyle: .alert)
        let retry = UIAlertAction(title: "Retry", style: .default) { _ in
            retryAction()
        }
        alert.addAction(retry)
        viewController.present(alert, animated: true, completion: nil)
    }
    private func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
