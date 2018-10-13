//
//  NSLayoutConstraint+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit

public extension NSLayoutConstraint {
    
    //- (void)animateMultiplierToValue:(CGFloat)value view:(UIView*)view {
    //
    //    [UIView animateWithDuration:0.3 animations:^{
    //        self.multiplier = value;
    //        [view layoutIfNeeded];
    //    }];
    //
    //}
    
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
}
