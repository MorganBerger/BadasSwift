//
//  NSLayoutConstraint+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension NSLayoutConstraint {
    
    func animateConstraintTo(_ value:CGFloat, for view:UIView, duration:Double) {
        
        UIView.animate(withDuration: duration) {
            self.constant = value
            view.layoutIfNeeded()
        }
    }
    
    func animateConstraintTo(_ value:CGFloat, for view:UIView, duration:Double, completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: duration, animations: {
            self.constant = value
            view.layoutIfNeeded()
        }) { (finished) in
            completion()
        }
    }
    
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
