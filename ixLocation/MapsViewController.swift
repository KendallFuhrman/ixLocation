//
//  FirstViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/5/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, AddActivityDelegate {

    // need to implement delegate protocol
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager : CLLocationManager!
    var currentUserLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Always show the users location
        map.showsUserLocation = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    
      
    }
    
    func didSaveActivity(activity: Activity) {
        print(activity)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2DMake((activity.location?.lat)!, (activity.location?.lng)!)
        
        annotation.title = activity.name
        
        map.addAnnotation(annotation)
        
    }
    
    func didCancelActivity() {
    }

    override func viewDidAppear(_ animated: Bool) {
        setMapType()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        func setMapType() {
            let mapType = UserDefaults.standard.string(forKey: "mapType")
            
            if mapType != nil{
                
                if mapType == "hybrid" {
                    map.mapType = .hybrid
                }
                
                if mapType == "standard" {
                    map.mapType = .standard
                }
                
                if mapType == "satellite" {
                    map.mapType = .satellite
                }
            }
        }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            // Get the users location from the array of locations
            let userLocation: CLLocation = locations[0] as CLLocation
            
            // You can call stopUpdatingLocation() to stop listening for location updates
            // manager.stopUpdatingLocation()
            
            print("user latitude = \(userLocation.coordinate.latitude)")
            print("user longitude = \(userLocation.coordinate.longitude)")
            
            // Store reference to the users location in the class instance (self)
            self.currentUserLocation = userLocation
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        // An error occurred trying to retrieve users location
        print("Error \(error)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "navFromMap" {
            let navigationViewController = segue.destination as!
            UINavigationController
            let addActivityViewController = navigationViewController.topViewController as! AddActivityViewController
            
            let activity = Activity()
            activity?.location = GeoPoint()
            
            activity?.location?.lat = currentUserLocation.coordinate.latitude
            activity?.location?.lng  = currentUserLocation.coordinate.longitude
            
            addActivityViewController.newActivity = activity
            addActivityViewController.delegate = self
        }
        
    }

}

