//
//  UIImage+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension UIImage {
    
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
    

    public func isEqualTo(_ image: UIImage) -> Bool {
        let data1: Data? = UIImagePNGRepresentation(self)
        let data2: Data? = UIImagePNGRepresentation(image)
        
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
