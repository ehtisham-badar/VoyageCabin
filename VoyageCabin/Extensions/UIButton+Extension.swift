//
//  UIButton+Extension.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation
import UIKit

extension UIButton {
    func applyMainGradient() {
        // Remove existing gradient layers (to avoid stacking)
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })

        let gradient = AppGradients.mainGradientLayer(frame: self.bounds)
        self.layer.insertSublayer(gradient, at: 0)
        self.clipsToBounds = true
    }
}
