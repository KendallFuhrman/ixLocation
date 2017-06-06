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
 

    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    

    
    @IBAction func saveActivity(_ sender: Any) {
        
        newActivity?.name = nameTextField.text!
        newActivity?.description = descriptionTextField.text!
        
        delegate?.didSaveActivity(activity: newActivity!)
        dismiss(animated: true, completion: nil)
        

    }
    @IBAction func cancelActivity(_ sender: Any) {
        delegate?.didCancelActivity()
        dismiss(animated: true, completion: nil)
        func unwindTo (segue: UIStoryboardSegue) {
        }
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
