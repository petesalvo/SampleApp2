//
//  PetManager.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

class PetManager {
    
    private var _petsArray : [Pet]
    
    init() {
        _petsArray = [Pet]()
    }
    
    func addPet(pet : Pet) {
        _petsArray.append(pet)
    }
    
    func removePet(index : Int) {
        _petsArray.removeAtIndex(index)
    }
    
    func empty() {
        _petsArray.removeAll()
    }
    
    var count : Int {
        get {
            return _petsArray.count
        }
    }
    
}