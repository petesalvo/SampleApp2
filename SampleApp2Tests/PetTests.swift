//
//  PetTests.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import XCTest
import SampleApp2

class PetTests: XCTestCase {

    private var _pet : Pet!
    
    private var _name : String = ""
    private var _owner : String = ""
    private var _type : String = ""
    private var _age : Int = 0
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConstructerAssignsValuesCorrectly() {
        givenAPetName("Fuzzy")
        givenAPetOwner("Horatio Jones")
        givenAPetType("Grey Tabby")
        givenAPetAge(3)
        
        whenPetConstructed()
        
        thenPetNameIs("Fuzzy")
        thenPetOwnerIs("Horatio Jones")
        thenPetTypeIs("Grey Tabby")
        thenPetAgeIs(3)
        
        thenPetAgeAsStringIs("3")
        
    }

//MARK: BDD utility methods
    
    func givenAPetName(name : String) {
        _name = name
    }
    
    func givenAPetOwner(owner : String) {
        _owner = owner
    }
    
    func givenAPetType(type : String) {
        _type = type
    }
    
    func givenAPetAge(age : Int) {
        _age = age
    }
    
    func whenPetConstructed() {
        _pet = Pet(name: _name, owner: _owner, type: _type, age: _age)
    }
    
    func thenPetNameIs(name : String) {
        XCTAssertEqual(name, _pet.Name,  "Expected pet name to be \(name) but was \(_pet.Name)")
    }
    
    func thenPetOwnerIs(owner : String) {
        XCTAssertEqual(owner, _pet.Owner,  "Expected pet owner to be \(owner) but was \(_pet.Owner)")
    }
    
    func thenPetTypeIs(type : String) {
        XCTAssertEqual(type, _pet.Type,  "Expected pet type to be \(type) but was \(_pet.Type)")
    }
    
    func thenPetAgeIs(age : Int) {
        XCTAssertEqual(age, _pet.Age,  "Expected pet age to be \(age) but was \(_pet.Age)")
    }
    
    func thenPetAgeAsStringIs(age : String) {
        XCTAssertEqual(age, _pet.AgeAsString,  "Expected pet age as string to be \(age) but was \(_pet.AgeAsString)")
    }
}
