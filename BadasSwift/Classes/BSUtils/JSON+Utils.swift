//
//  JSON+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 08/09/2020.
//

import SwiftyJSON

extension JSON {
    func stringify() -> String? {
        return self.rawString(.utf8, options: [])
    }
}
