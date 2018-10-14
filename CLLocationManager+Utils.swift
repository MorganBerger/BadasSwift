//
//  CLLocationManager+Utils.swift
//  BadasSwift
//
//  Created by Morgan Berger on 13/10/2018.
//

import CoreLocation

public extension CLLocationManager {
    static var isAuthorized:Bool {
        
        return (CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse)
        
    }
}
