//
//  CGFloat+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 09/09/2020.
//

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
