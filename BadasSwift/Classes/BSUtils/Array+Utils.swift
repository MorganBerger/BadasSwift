//
//  Array+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 08/09/2020.
//

extension Array {
    func find(_ f: (Iterator.Element) -> Bool) -> Iterator.Element? {
        for x in self {
            if f(x) {
                return x
            }
        }
        return nil
    }
}
