//
//  ColorConstants.swift
//  VoyageCabin
//
//  Created by APPLE on 25/04/2025.
//

import Foundation
import UIKit

struct AppGradients {
    static func mainGradientLayer(frame: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [
            UIColor(named: "gradientStart")?.cgColor ?? UIColor.systemBlue.cgColor,
            UIColor(named: "gradientEnd")?.cgColor ?? UIColor.systemPurple.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.cornerRadius = frame.height / 2 // Optional: make it pill-shaped
        return gradient
    }
}
