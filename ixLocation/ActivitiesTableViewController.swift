//
//  ActivitiesTableViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/6/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import MapKit
class ActivitiesTableViewController: UITableViewController, AddActivityDelegate, CLLocationManagerDelegate {
    
    var activities: [Activity] = []
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
        // Dispose of any resources that can be recreated.
    }
    
    func didSaveActivity(activity: Activity) {
        activities.append(activity)
        self.tableView.reloadData()
    }
    
    func didCancelActivity() {
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = activities[indexPath.row].name
        cell.detailTextLabel?.text = activities[indexPath.row].description

        return cell
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
        
        if segue.identifier == "navToAddActivity" {
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
