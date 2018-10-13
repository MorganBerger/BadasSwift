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

    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setStatusBarColor(UIColor.red)
        
        if (img.image!.isEqualTo(UIImage(named: "1x1_sol_trottoire")!)) {
            print("Images are equals")
        }
        
        let image = img.image!.convertToGrayScale()
        img.image = image
        
        UIImage.getImageWithURL(URL(string: "https://objectivec2swift.com/img/logo-text.png")!) { (img) in
            if (img != nil) {
                self.img.image = img
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

