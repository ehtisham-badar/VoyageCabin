//
//  UIButton+Extension.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation
import UIKit

extension UIView {
    func applyLinearGradient(color1: UIColor, color2: UIColor) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [color1.cgColor, color2.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)  // Start from the left
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)    // End at the right
            self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
}
