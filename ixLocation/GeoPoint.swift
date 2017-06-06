//
//  GeoPoint.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/6/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import Foundation
class GeoPoint {
    
    var lat: Double
    var lng: Double
    
    init(latitude lat: Double, longitude lng: Double) {
        self.lat = lat
        self.lng = lng
}
}
