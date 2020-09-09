//
//  NSObject+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 09/09/2020.
//


extension NSObject {
    var className: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
}
