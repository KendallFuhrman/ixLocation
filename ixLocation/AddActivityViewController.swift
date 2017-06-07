//
//  AddActivityViewController.swift
//  ixLocation
//
//  Created by Kendall Fuhrman on 6/5/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var imageField: UIImageView!
 
    
    var newActivity: Activity?
    var delegate: AddActivityDelegate?

    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveActivity(_ sender: Any) {
        
        newActivity = Activity(name: nameTextField.text,
            description: descriptionTextField.text)
        
        delegate?.didSaveActivity(activity: newActivity!)
    
        dismiss(animated: true, completion: nil)
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
