//
//  Error+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 09/09/2020.
//

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
