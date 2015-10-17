//
//  PetManagerTests.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import XCTest
import SampleApp2

class PetManagerTests: XCTestCase {

    private var _petManager : PetManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testManagerCountIsCorrect() {
        givenAPetManager()
        givenAPet(RandomPet.random())
        givenAPet(RandomPet.random())
        thenPetCountIs(2)
    }

    
    //MARK: BDD utility methods
    
    func givenAPet(pet : Pet) {
        _petManager.addPet(pet, closure: nil)
    }
    
    func givenAPetManager() {
        _petManager = PetManager()
    }

    func thenPetCountIs (count : Int) {
        XCTAssertEqual(count, _petManager.count, "Pet count wrong")
    }
    
}
