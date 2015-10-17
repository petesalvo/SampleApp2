//
//  Pet.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

public class Pet {
    
    private var _petName : String
    private var _petDOB : String
    
    public init(name: String, dob : String) {
        _petName = name
        _petDOB = dob
    }
    
    public var Name : String {
        get {
            return _petName
        }
    }
    
    public var DOB : String {
        get {
            return _petDOB
        }
    }
}