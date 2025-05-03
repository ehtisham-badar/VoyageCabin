//
//  UIImage+Extension.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation
import UIKit
import ImageIO

extension UIColor{
    
    static var selectIcon: UIImage?{
        return UIImage(named: "selectIcon")
    }
    static var unSelectIcon: UIImage?{
        return UIImage(named: "unselecticon")
    }
}

extension UIImage {
    static func gif(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif"),
              let imageData = try? Data(contentsOf: bundleURL) else {
            print("Gif named \(name) not found")
            return nil
        }
        return gif(data: imageData)
    }

    static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

        var images = [UIImage]()
        var duration: TimeInterval = 0

        for i in 0..<CGImageSourceGetCount(source) {
            guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else { continue }
            let frameDuration = UIImage.frameDuration(for: source, at: i)
            duration += frameDuration
            images.append(UIImage(cgImage: cgImage))
        }

        return UIImage.animatedImage(with: images, duration: duration)
    }

    private static func frameDuration(for source: CGImageSource, at index: Int) -> TimeInterval {
        let defaultFrameDuration = 0.1
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [CFString: Any],
              let gifInfo = properties[kCGImagePropertyGIFDictionary] as? [CFString: Any],
              let delay = gifInfo[kCGImagePropertyGIFUnclampedDelayTime] as? TimeInterval ?? gifInfo[kCGImagePropertyGIFDelayTime] as? TimeInterval else {
            return defaultFrameDuration
        }
        return delay > 0.011 ? delay : defaultFrameDuration
    }
}
