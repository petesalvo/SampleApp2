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
    private let _petsToDownload : Int = 3
    
    init() {
        _petsArray = [Pet]()
    }
    
    func downloadPets(closure : CompletionBlock) {
        
        print("Downloading pets from Remote location... ")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            
            var downloadedPets : Int = 0
            repeat {
                downloadedPets += 1
                print("\"Downloaded\" Pet \(downloadedPets)")
                
                 NSThread.sleepForTimeInterval(1)
            } while downloadedPets < self._petsToDownload
            
            closure()
            
        }
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