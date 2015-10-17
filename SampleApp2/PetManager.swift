//
//  PetManager.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

public typealias CompletionBlock = () -> Void

class PetManager {
    
    private var _petsArray : [Pet]
    
    init() {
        _petsArray = [Pet]()
    }
    
    func addPet(pet : Pet, closure : CompletionBlock) {
        _petsArray.append(pet)
        closure()
    }
    
    func removePetAtIndex(index : Int, closure : CompletionBlock) {
        _petsArray.removeAtIndex(index)
        closure()
    }
    
    func petAtIndex(index : Int) -> Pet {
        return _petsArray[index]
    }
    
    func empty(closure : CompletionBlock) {
        _petsArray.removeAll()
        closure()
    }
    
    var count : Int {
        get {
            return _petsArray.count
        }
    }
    
}