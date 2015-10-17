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
    
    var _pet : Pet!
    
    var petDetail: Pet? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    var savedPed : Pet {
        get {
            return _pet
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

        
        _pet = Pet(name: txtPetName.text!, owner: txtPetOwner.text!, type: txtPetType.text!, age: 4, imageName: petDetail!.imageName)
                
        if (actionToPerformWhenPetSaved != nil) {
            self.dismissViewControllerAnimated(true, completion: actionToPerformWhenPetSaved)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func dismissChanges(sender : AnyObject?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

