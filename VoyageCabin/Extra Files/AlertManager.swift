//
//  AlertManager.swift
//  VoyageCabin
//
//  Created by APPLE on 10/05/2025.
//

import UIKit
import Foundation

class AlertManager {
    static let shared = AlertManager()
    private init() {}
    
    func showAlert(on viewController: UIViewController, message: String, actionText: String, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: actionText, style: .default) { _ in
                completion()
            }
            
            alertController.addAction(action)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
