//
//  CharacterSet+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

extension CharacterSet {
    static let urlAllowed = CharacterSet.urlFragmentAllowed
        .union(.urlHostAllowed)
        .union(.urlPasswordAllowed)
        .union(.urlQueryAllowed)
        .union(.urlUserAllowed)
}
