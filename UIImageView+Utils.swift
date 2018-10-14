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
    
//    - (void)setImageWithWebUrl:(NSString*)url completion:(void(^)(UIImage *img))completion {
//
//    NSURL *imgUrl = [NSURL URLWithString:url];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//    [UIImage getImageWithURL:imgUrl completion:^(UIImage *img) {
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//    [self setImage:img];
//
//    NSLog(@"%@ loaded", url);
//
//    if (completion) completion(self.image);
//    });
//
//    }];
//    });
//    }

}
