//
//  PetManager.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

public typealias CompletionBlock = () -> Void

public class PetManager {
    
    private var _petsArray : [Pet]
    private let _petsToDownload : Int = 3
    
    public init() {
        _petsArray = [Pet]()
    }
    
    public func downloadPets(closure : CompletionBlock) {
        
        print("Downloading pets from Remote location... ")
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            
            // Simuate some network latency
            NSThread.sleepForTimeInterval(1.5)
            
            var downloadedPets : Int = 0
            repeat {
                downloadedPets += 1
                print("\"Downloaded\" Pet \(downloadedPets)")
                
                self.addPet(RandomPet.random(), closure: nil)

                NSThread.sleepForTimeInterval(1)
            } while downloadedPets < self._petsToDownload
            
            closure()
            
        }
    }
    
    public func addPet(pet : Pet, closure : CompletionBlock?) {
        _petsArray.append(pet)
        if closure != nil {
            closure!()
        }
    }
    
    public func removePetAtIndex(index : Int, closure : CompletionBlock?) {
        _petsArray.removeAtIndex(index)
        if closure != nil {
            closure!()
        }
    }
    
    public func removeLastPet() {
        if !_petsArray.isEmpty {
            _petsArray.removeLast()
        } else {
            print("Warning: no pets to remove!")
        }
    }
    
    public func removeFirstPet() {
        if !_petsArray.isEmpty {
            _petsArray.removeFirst()
        } else {
            print("Warning: no pets to remove!")
        }
    }
    
    public func petAtIndex(index : Int) -> Pet {
        return _petsArray[index]
    }
    
    public func replacePetAtIndex(index : Int, pet : Pet) {
        _petsArray[index] = pet
    }
    
    public var petCount : Int {
        get {
            return _petsArray.count
        }
    }
    
}