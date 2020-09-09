//
//  DesignableView.swift
//  SoundR
//
//  Created by Cyril Trosset on 27/10/2016.
//  Copyright © 2016 SoundR. All rights reserved.
//

import UIKit

//@IBDesignable
class BaseNibControl: UIControl {
    
    // INIT
    var view: UIView!
    var nibName:String{
        return String(describing: type(of: self))
    }
    
    // INIT
    override init(frame: CGRect) {
        // properties
        super.init(frame: frame)
        
        // Set anything that uses the view or visible bounds
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // properties
        super.init(coder: aDecoder)
        
        // Setup
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.isUserInteractionEnabled = false
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}

