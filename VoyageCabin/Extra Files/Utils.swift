//
//  Utils.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation
import UIKit

enum Utils {
    
    static func styledText(firstString: String, secondString: String, font: UIFont) -> NSAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.textCharcoalColor!,
            .font: font
        ]
        
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.appColor!,
            .font: font
        ]
        
        let firstAttributedString = NSAttributedString(string: firstString + "\n", attributes: firstAttributes)
        let secondAttributedString = NSAttributedString(string: secondString, attributes: secondAttributes)
        
        let combined = NSMutableAttributedString()
        combined.append(firstAttributedString)
        combined.append(secondAttributedString)
        
        return combined
    }
}
