//
//  Pet.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation
import UIKit


public class Pet {
    
    private var _name : String
    private var _owner : String
    private var _type : String
    private var _age : Int
    private var _image : UIImage?

    
    public init(name: String, owner : String, type : String, age : Int) {
        _name = name
        _owner = owner
        _type = type
        _age = age
        
        _image = nil
        if let thumbnail = UIImage(named: "petPic1") {
            _image = thumbnail
        }
    }
    
    public var Name : String {
        get {
            return _name
        }
    }
    
    public var Owner : String {
        get {
            return _owner
        }
    }
    
    public var Type : String {
        get {
            return _type
        }
    }
    
    public var Age : Int {
        get {
            return _age
        }
    }
    
    public var AgeAsString : String {
        get {
            return "\(_age)"
        }
    }
    
    public var Image : UIImage? {
        get {
            return _image
        }
    }
    
    //let rand = Int(arc4random_uniform(7))
    
    
}