//
//  Date+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 14/10/2018.
//

import UIKit

public extension Date {
    
    func formatedString(_ format:String) -> String {
        
        let formatter:DateFormatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format
        
        let result = formatter.string(from: self)
        
        return result
    }
}
