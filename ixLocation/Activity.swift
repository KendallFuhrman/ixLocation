//
//  Activity.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/6/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import Foundation
import UIKit

class Activity {
    var name: String?
    var description: String?
    var location: GeoPoint?
    
    init?() {
        self.name = ""
        self.description = ""
        self.location = GeoPoint(latitude: 0.0, longitude: 0.0)
    }
    
    init?(name: String?, description: String?) {
        self.name = name
        self.description = description
        
    }

}
