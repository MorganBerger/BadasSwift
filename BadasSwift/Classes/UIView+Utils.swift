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
    
}
