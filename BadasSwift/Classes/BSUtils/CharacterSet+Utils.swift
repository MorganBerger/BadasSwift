//
//  CharacterSet+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

extension CharacterSet {
//    static let urlAllowed = CharacterSet.urlFragmentAllowed
//        .union(.urlHostAllowed)
//        .union(.urlPasswordAllowed)
//        .union(.urlQueryAllowed)
//        .union(.urlUserAllowed)
//    
    static let urlAllowed = CharacterSet.urlFragmentAllowed
        .union(.urlHostAllowed)
        .union(.urlPasswordAllowed)
        .union(.urlQueryAllowed)
        .union(.urlUserAllowed)
        .union(.urlPathAllowed)
    
    static let URLAllowed = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~:/?#[]@!$&'()*+,;=%")
    
    static let urlNoSpecialChar = CharacterSet(charactersIn: " !*'();:@&=+$,/?%#[]").inverted
}
