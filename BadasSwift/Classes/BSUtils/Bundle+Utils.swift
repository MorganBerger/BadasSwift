//
//  Bundle+Utils.h
//  BadasSwift
//
//  Created by Morgan Berger on 14/10/2018.
//

public extension Bundle {
    var versionNumber:String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
