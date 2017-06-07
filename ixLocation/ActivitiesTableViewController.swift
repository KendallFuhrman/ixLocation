//
//  ActivitiesTableViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/6/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit

class ActivitiesTableViewController: UITableViewController, AddActivityDelegate {
    
    var activities: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        let activity1 = Activity(name: "Act1", description: "activity 1")
        activities.append(activity1!)
        
        let activity2 = Activity(name: "Act2", description: "Activity 2")
        activities.append(activity2!)

 */
        

        
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
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "navToAddActivity" {
            let navigationViewController = segue.destination as!
            UINavigationController
            let addActivityViewController = navigationViewController.topViewController as! AddActivityViewController
            
        addActivityViewController.delegate = self
        }
      
    }
 

}
