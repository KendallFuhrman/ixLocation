//
//  SettingsTableViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/6/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import MapKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //nav items
        if indexPath.section == 1 && indexPath.row == 0 {
            self.tabBarController?.selectedIndex = 1
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            self.tabBarController?.selectedIndex = 0
        }
        
    // settings items
        if indexPath.section == 2{
            
            // deselect all
            tableView.cellForRow(at: IndexPath(row: 0,
                section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 1,
                section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row: 2,
                section: 2))?.accessoryType = .none
            
            // choose cell
            if let cell = tableView.cellForRow (at:indexPath) {
                
                if indexPath.row == 0 {
                    UserDefaults.standard.set("standard",
                        forKey: "mapType")
                    tableView.cellForRow (at: IndexPath(row: indexPath.row, section: 2))?.accessoryType = .checkmark
                    
                }
                if indexPath.row == 1 {
                    UserDefaults.standard.set("satelite", forKey: "mapType")
                    tableView.cellForRow (at: IndexPath(row: indexPath.row, section: 2))?.accessoryType = .checkmark

                }
                if indexPath.row == 2 {
                    UserDefaults.standard.set("hybrid", forKey: "mapType")
                    tableView.cellForRow (at: IndexPath(row: indexPath.row, section: 2))?.accessoryType = .checkmark

                }
            
            cell.accessoryType = .checkmark
        }
    }
}
}
