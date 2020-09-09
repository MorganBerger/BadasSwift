//
//  UserDefaults+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 08/09/2020.
//

extension UserDefaults {
    func setData(_ value: Any, key: String) {
        let archivedPool = NSKeyedArchiver.archivedData(withRootObject: value)
        self.set(archivedPool, forKey: key)
    }

    func getData<T>(key: String) -> T? {
        if let val = self.value(forKey: key) as? Data,
            let obj = NSKeyedUnarchiver.unarchiveObject(with: val) as? T {
            return obj
        }
        return nil
    }
}
