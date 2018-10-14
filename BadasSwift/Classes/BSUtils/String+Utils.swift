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
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
        
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
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

public extension StringProtocol where Index == String.Index {
    func index<T: StringProtocol>(of String: T, options: String.CompareOptions = []) -> Index? {
        return range(of: String, options: options)?.lowerBound
    }
    func endIndex<T: StringProtocol>(of String: T, options: String.CompareOptions = []) -> Index? {
        return range(of: String, options: options)?.upperBound
    }
    func indexes<T: StringProtocol>(of String: T, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex, let range = range(of: String, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges<T: StringProtocol>(of String: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex, let range = range(of: String, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound  ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
