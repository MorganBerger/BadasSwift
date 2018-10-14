//
//  URL+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

public extension URL {
    
    static func verifyUrl(string: String?) -> Bool {
        //Check for nil
        if let urlString = string {
            // create NSURL instance
            if let url = URL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
}
