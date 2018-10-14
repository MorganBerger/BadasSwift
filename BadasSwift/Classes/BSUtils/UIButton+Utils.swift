//
//  UIButton+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 14/10/2018.
//

import UIKit

extension UIButton {
    
    func alignTextHorizontal(spacing: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom:0, right: imageSize.height)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: titleSize.width, bottom: 8, right: 8)
        
//        let/ edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
//        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}
