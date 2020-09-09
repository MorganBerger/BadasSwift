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
    
    func validateUrl () -> Bool {
//        Old RegEx
//        let urlRegEx = "((http(s)?(\\:\\/\\/))+(www\\.)?([\\w\\-\\.\\/])*(\\.[a-zA-Z]{1,3}\\/?))[^\\s\\b\\n|]*[^.,;:\\?\\!\\@\\^\\$ -]"
        let urlRegEx = "https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,5}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)"
        let ipRegEx = "http:\\/\\/\\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.|:[0-9]+|$)){4}\\b"
        
        let res = NSPredicate(format: "SELF MATCHES %@ OR SELF MATCHES %@", urlRegEx, ipRegEx).evaluate(with: self.absoluteString)
        return res
    }
    
    func isMobileURL() -> Bool {
        if (self.absoluteString.contains("://m.") ||
            self.absoluteString.contains(".m.") ||
            self.absoluteString.contains("://mobile.") ||
            self.absoluteString.contains(".mobile.")) {
            return true
        }
        return false
    }
}
