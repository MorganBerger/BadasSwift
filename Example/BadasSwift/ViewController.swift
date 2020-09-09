//
//  ViewController.swift
//  BadasSwift
//
//  Created by morganberger on 10/13/2018.
//  Copyright (c) 2018 morganberger. All rights reserved.
//


import UIKit
import CoreLocation
import BadasSwift

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgCenterY: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var voteView: VoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStatusBarColor(UIColor.red)
        
        let color1 = UIColor(red: 167/255, green: 200/255, blue: 255/255, alpha: 1).cgColor
        let color2 = UIColor(red: 99/255, green: 153/255, blue: 242/255, alpha: 1).cgColor
        
        self.view.putGradient(direction: .diagonalDesc, colors: color1, color2)
        
        let str:String = "Hello World!"
        print("String : '\(str)'")
//        print("MD5 Hex: \(str.MD5Hex())")
//        print("MD5 b64: \(str.MD5base64())")
        print("-----------------------------\n")
        
        print("Location manager is authorized: \(CLLocationManager.isAuthorized)")
        
        let _ = URL.verifyUrl(string:"http://www.google.com")
        
        button.putBorders(color: UIColor.blue)
        
        if (imgView.image!.isEqualTo(UIImage(named: "digitick")!)) {
            print("Images are equals")
        }
        
        let date = Date()
        
        print("Today's date is: \(date.formatedString("EEEE, MMM d, yyyy"))")
        
        let img = imgView.image
        imgView.image = img?.cropToBounds(width: 70, height: 70)
        
        imgView.putBorders(color: .purple)
        imgView.contentMode = .scaleAspectFit
        
    }

    //MARK: - IBActions methods
    @IBAction func btnAction(_ sender: UIButton) {
        sender.rootView.removeAllSubviews()
    }
}

