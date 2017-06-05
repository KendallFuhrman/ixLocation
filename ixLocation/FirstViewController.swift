//
//  FirstViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/5/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, CLLocationManagerDelegate {

    // need to implement delegate protocol
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager : CLLocationManager!
    var currentUserLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        

      
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            // Get the users location from the array of locations
            let userLocation: CLLocation = locations[0] as CLLocation
            
            // You can call stopUpdatingLocation() to stop listening for location updates
            // manager.stopUpdatingLocation()
            
            print("user latitude = \(userLocation.coordinate.latitude)")
            print("user longitude = \(userLocation.coordinate.longitude)")
            
            // Store reference to the users location in the class instance (self)
            self.currentUserLocation = userLocation

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
        {
            // An error occurred trying to retrieve users location
            print("Error \(error)")
        }
}
}
}
