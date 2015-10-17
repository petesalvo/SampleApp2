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

    private var _petName : String = ""
    private var _petDOB : String = ""
    private var _pet : Pet!
    
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
        givenAPetDOB(DateFormatter.dateInMMddYYYYFormatFromString("12/2/2014"))
        whenPetConstructed()
        thenPetNameIs("Fuzzy")
        thenPetDOBIs("12/2/2014")
    }

//MARK: BDD utility methods
    
    func givenAPetName(name : String) {
        _petName = name
    }
    
    func givenAPetDOB(dob : String) {
        _petDOB = dob
    }
    
    func whenPetConstructed() {
        _pet = Pet(name: _petName, dob: _petDOB)
    }
    
    func thenPetNameIs(name : String) {
        XCTAssertEqual(name, _pet.Name,  "Expected pet name to be \(name) but was \(_pet.Name)")
    }
    
    func thenPetDOBIs(dob : String) {
        XCTAssertEqual(dob, _pet.DOB,  "Expected pet DOB to be \(dob) but was \(_pet.DOB)")
        
    }
    
    
}
