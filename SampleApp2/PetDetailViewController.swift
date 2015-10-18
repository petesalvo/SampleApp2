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
    @IBOutlet weak var txtPetOwner: UITextField!
    
    @IBOutlet weak var txtPetAge: UITextField!
    @IBOutlet weak var txtPetType: UITextField!
    
    @IBOutlet weak var imgPetImage: UIImageView!
    
    var actionToPerformWhenPetSaved : CompletionBlock? = nil
    
    var petDetail: Pet? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let pet = self.petDetail {
            
            if let nameTextField = self.txtPetName {
                nameTextField.text = pet.name
            }
            
            if let ownerTextField = self.txtPetOwner {
                ownerTextField.text = pet.owner
            }
            
            if let ageTextField = self.txtPetAge {
                ageTextField.text = pet.ageAsString
            }
            
            if let typeTextField = self.txtPetType {
                typeTextField.text = pet.type
            }
            
            if
                let petImage = self.imgPetImage,
                let image = pet.image {
                petImage.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    

    @IBAction func saveChanges(sender : AnyObject?) {
        
        if let petAge = Int(txtPetAge.text!) {
            let pet : Pet = Pet(name: txtPetName.text!, owner: txtPetOwner.text!, type: txtPetType.text!, age: petAge, imageName: petDetail!.imageName)
            self.dismissViewControllerAnimated(true, completion: actionToPerformWhenPetSaved ?? nil)
            self.petDetail = pet
            
        } else {
            displayNonNumericAgeMessage()
        }
    }

    private func displayNonNumericAgeMessage() {
        
        let alertController : UIAlertController = UIAlertController(title: "Invalid age", message: "Please enter a number for Pet Age", preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "OK", style: .Default) { (action) in
            //No action needed
        }
        alertController.addAction(ok)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func dismissChanges(sender : AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

