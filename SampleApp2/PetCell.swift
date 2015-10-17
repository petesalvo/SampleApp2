//
//  PetCell.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation
import UIKit

public class PetCell : UITableViewCell {
 
    
    @IBOutlet weak var lblPetName : UILabel!
    @IBOutlet weak var lblPetOwner : UILabel!
    @IBOutlet weak var lblPetType : UILabel!
    @IBOutlet weak var lblPetAge : UILabel!
    
    @IBOutlet weak var imgPetImage : UIImageView!
    
    
    public func setPet(pet : Pet) {
        lblPetName.text = pet.Name
        lblPetOwner.text = pet.Owner
        lblPetType.text = pet.Type
        lblPetAge.text = pet.AgeAsString
        
        if let image = pet.Image {
            imgPetImage.image = image 
        }
        
    }
    
}