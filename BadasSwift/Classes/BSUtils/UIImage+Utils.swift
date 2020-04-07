//
//  UIImage+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension UIImage {
    func cropToBounds(width: Double, height: Double) -> UIImage {
        
        let cgimage = self.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        return image
    }
}

extension UIImage {
    
    // Turn an image black & white in one click!
    public func convertToGrayScale() -> UIImage {
        
        // Create image rectangle with current image width/height
        let imageRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)

        context?.draw(self.cgImage!, in: imageRect)

        let imageRef = context?.makeImage()
        let newImage = UIImage(cgImage: imageRef!)

        return newImage
    }
    
    public func scaleImage(scaleToSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(scaleToSize)
        
        self.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: scaleToSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    // Check if 2 images are identical.
    public func isEqualTo(_ image: UIImage) -> Bool {
        let data1: Data? = self.pngData()
        let data2: Data? = image.pngData()
        
        return data1 == data2
    }

    // Want to asynchronously download any image from its web url? Right here pal!
    // the completion() block is called in main thread for UI updates purposes.
    public class func getImageWithURL(_ url:URL, completion:@escaping (_ img:UIImage?) -> Void) {
        
        DispatchQueue.global(qos: .utility).async {
            do {
                let data = try Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } catch {
                print("UIImage+Utils: getImageWithURL() - Something went wrong getting image from url.")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
