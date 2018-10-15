//
//  UIImageView+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension UIImageView {
    
    func setImageWithUrlString(_ urlStr:String, completion:@escaping (_ img:UIImage?) -> Void) {
        
        let url:URL? = URL(string: urlStr)
        
        if (url != nil) {
            UIImage.getImageWithURL(url!, completion: { (img) in
                
                self.image = img
                completion(img)
            })
        }
    }
}
