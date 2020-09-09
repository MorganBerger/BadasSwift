//
//  Date+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 14/10/2018.
//

import UIKit

public extension Date {
    
    init(dateString:String) {
        
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yyyy"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    
    func formatedString(_ format:String) -> String {
        
        let formatter:DateFormatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format
        
        let result = formatter.string(from: self)
        
        return result
    }
    
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
