//
//  UIView+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension UIView {

    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    func showWithDuration(_ duration:Double) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    func hideWithDuration(_ duration:Double) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0.0
        }
    }
    
    func showWithDuration(_ duration:Double, completion:@escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }, completion: { (finished) in
            completion()
        })
    }
    func hideWithDuration(_ duration:Double, completion:@escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: { (finished) in
            completion()
        })
    }
    
    func putBorders(color:UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        
    }
    
    var rootView:UIView {
        var view = self
        while view.superview != nil {
            view = view.superview!
        }
        return view
    }
    
    @discardableResult
    func addBorders(edges: UIRectEdge,
                    color: UIColor,
                    inset: CGFloat = 0.0,
                    thickness: CGFloat = 1.0) -> [UIView] {
        
        var borders = [UIView]()
        
        @discardableResult
        func addBorder(formats: String...) -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            addSubview(border)
            addConstraints(formats.flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: [],
                                               metrics: ["inset": inset, "thickness": thickness],
                                               views: ["border": border]) })
            borders.append(border)
            return border
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
        }
        
        return borders
    }
    
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    @available(iOS 10.0, *)
    func toImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
