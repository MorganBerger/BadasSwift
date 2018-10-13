//
//  String+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import UIKit
import Foundation
import CommonCrypto

public extension String {
    
    func MD5Data() -> Data {
        let messageData = self.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }
    
    public func MD5Hex() -> String {
        let md5Hex =  self.MD5Data().map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
    
    public func MD5base64() -> String {
        return self.MD5Data().base64EncodedString()
    }
}
