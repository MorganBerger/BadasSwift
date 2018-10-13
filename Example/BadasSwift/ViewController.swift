//
//  ViewController.swift
//  BadasSwift
//
//  Created by morganberger on 10/13/2018.
//  Copyright (c) 2018 morganberger. All rights reserved.
//

import UIKit
import BadasSwift

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgCenterY: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarColor(UIColor.red)
        
        let str:String = "Hello World!"
        print("String : '\(str)'")
        print("MD5 Hex: \(str.MD5Hex())")
        print("MD5 b64: \(str.MD5base64())")
        print("-----------------------------\n")
        
        button.putBorders(color: UIColor.blue)
        
        if (imgView.image!.isEqualTo(UIImage(named: "digitick")!)) {
            print("Images are equals")
        }
        
        let image = imgView.image!.convertToGrayScale()
        imgView.image = image
        
        imgView.setImageWithUrlString("https://objectivec2swift.com/img/logo-text.png") { (img) in
            
            if (img != nil) {
                self.imgCenterY.animateConstraintTo(-100, for: self.view, duration: 1, completion: {
                    self.imgCenterY.animateConstraintTo(100.0, for: self.view, duration: 0.5)
                })
            }
        }
        
    }

    @IBAction func btnAction(_ sender: UIButton) {
        sender.rootView.removeAllSubviews()
    }
}

