//
//  Utilities.swift
//  VoyageCabin
//
//  Created by APPLE on 10/05/2025.
//

import Foundation
import UIKit

class Utilities {
    static let shared = Utilities()
    
    private init() {}
    func showLoader(loader: UIActivityIndicatorView) {
        loader.isHidden = false
        loader.startAnimating()
    }
}
