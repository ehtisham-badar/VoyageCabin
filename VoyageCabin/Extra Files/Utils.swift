//
//  Utils.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation
import UIKit
import SystemConfiguration

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
    static func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
extension UIViewController{
    func alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
