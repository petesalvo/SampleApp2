//
//  PetDetailViewController.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import UIKit

class PetDetailViewController: UIViewController {

    @IBOutlet weak var txtPetName: UITextField!
    
    var petDetail: Pet? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let pet = self.petDetail {
            if let textField = self.txtPetName {
                textField.text = pet.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func saveChanges(sender: AnyObject) {
        print("attempting to dismiss")
//        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
//        if let split = self.splitViewController {
//            let controllers = split.viewControllers
//            let navControll = controllers[controllers.count-1] as! UINavigationController
//            
//            navControll.dismissViewControllerAnimated(true, completion: nil)
//        }

        
    }

}

