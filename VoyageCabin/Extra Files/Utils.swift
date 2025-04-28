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
    
    static func attributedString(fullText: String,
                                 coloredPart: String,
                                 color: UIColor,
                                 font: UIFont) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: fullText)
        
        attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: fullText.count))
        let range = (fullText as NSString).range(of: coloredPart)
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        }
        
        return attributedString
    }
}
