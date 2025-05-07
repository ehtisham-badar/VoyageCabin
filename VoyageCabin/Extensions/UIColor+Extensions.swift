//
//  UIColor+Extensions.swift
//  MonsoTech
//
//  Created by Umer Yasin on 23/06/2024.
//

import UIKit

extension UIColor{
    
    static var appColor: UIColor?{
        return hexStringToUIColor(hex: "369FFF")
    }
    static var textCharcoalColor: UIColor? {
        return hexStringToUIColor(hex: "1A1A1A")
    }
    
    static var gradient1color: UIColor? {
        return hexStringToUIColor(hex: "#7AC0FF")
    }
    
    static var gradient2color: UIColor? {
        return hexStringToUIColor(hex: "#369FFF")
    }
    static var greenLightColor: UIColor? {
        return hexStringToUIColor(hex: "D9F2D9")
    }
    static var greyStrokeColor: UIColor? {
        return hexStringToUIColor(hex: "#D9D9D9")
    }
    static var labeBlueColor: UIColor? {
        return hexStringToUIColor(hex: "#5F7593")
    }
    
    static func hexStringToUIColor (hex:String, opacity: Double = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(opacity)
        )
    }
}
extension UIImage {
    static var clockgreen: UIImage? {
        return UIImage(named: "clockgreen")
    }
    static var calendargreen: UIImage? {
        return UIImage(named: "calendargreen")
    }
    static var clockred: UIImage? {
        return UIImage(named: "clock")
    }
    static var calendarred: UIImage? {
        return UIImage(named: "calendar")
    }
}
