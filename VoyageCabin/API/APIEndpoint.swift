//
//  APIEndpoint.swift
//  VoyageCabin
//
//  Created by APPLE on 09/05/2025.
//

import Foundation

enum APIEndpoint {
    case property_lister_onboarding
    case property_seeker_onboarding
    
    func url(baseURL: String) -> URL? {
        switch self {
        case .property_lister_onboarding:
            return URL(string: "\(baseURL)api/property-lister-onboarding/")
        case .property_seeker_onboarding:
            return URL(string: "\(baseURL)api/property-seeker-onboarding/")
        }
    }
}
