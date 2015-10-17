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
    private var _imageName : String

    
    public init(name: String, owner : String, type : String, age : Int, imageName : String) {
        _name = name
        _owner = owner
        _type = type
        _age = age
        _imageName = imageName
    }
    
    public var name : String {
        get {
            return _name
        }
    }
    
    public var owner : String {
        get {
            return _owner
        }
    }
    
    public var type : String {
        get {
            return _type
        }
    }
    
    public var age : Int {
        get {
            return _age
        }
    }
    
    public var ageAsString : String {
        get {
            return "\(_age)"
        }
    }
    
    public var imageName : String {
        get {
            return _imageName
        }
    }
    
    public var image : UIImage? {
        get {
            if let thumbnail = UIImage(named: _imageName) {
                return thumbnail
            }
            return nil
        }
    }    
    
}