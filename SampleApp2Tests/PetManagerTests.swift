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
    
    func testReplacePet() {
        givenAPetManager()
        givenAPet(Pet(name: "Duke", owner: "David Smith", type: "Egyptian Longhair", age: 6, imageName: ""))
        
        let newPet : Pet = Pet(name: "Lancelot", owner: "Karen Odoul", type: "Tabby", age: 5, imageName: "")
        _petManager.replacePetAtIndex(0, pet: newPet)
        
        let replacedPed = _petManager.petAtIndex(0)
        thenPetNameIs("Lancelot", pet: replacedPed)
        thenPetOwnerIs("Karen Odoul", pet: replacedPed)
        thenPetTypeIs("Tabby", pet: replacedPed)
        thenPetAgeAsStringIs("5", pet: replacedPed)
        
    }
    
    func testRemoveFirstPet() {
        givenAPetManager()
        givenAPet(Pet(name: "Duke", owner: "David Smith", type: "Egyptian Longhair", age: 6, imageName: ""))
        givenAPet(Pet(name: "Lancelot", owner: "Karen Odoul", type: "Tabby", age: 5, imageName: ""))
        whenFirstPetRemoved()
        
        let pet : Pet = _petManager.petAtIndex(_petManager.petCount - 1)
        thenPetNameIs("Lancelot", pet: pet)
        thenPetOwnerIs("Karen Odoul", pet: pet)
        thenPetTypeIs("Tabby", pet: pet)
        thenPetAgeAsStringIs("5", pet: pet)
    }
    
    func testRemoveLastPet() {
        givenAPetManager()
        givenAPet(Pet(name: "Duke", owner: "David Smith", type: "Egyptian Longhair", age: 6, imageName: ""))
        givenAPet(Pet(name: "Lancelot", owner: "Karen Odoul", type: "Tabby", age: 5, imageName: ""))
        givenAPet(Pet(name: "Sir Fuzzy", owner: "Bob Odenkirk", type: "Snake", age: 2, imageName: ""))
        
        whenLastPetRemoved()
        
        let pet : Pet = _petManager.petAtIndex(_petManager.petCount - 1)
        thenPetNameIs("Lancelot", pet: pet)
        thenPetOwnerIs("Karen Odoul", pet: pet)
        thenPetTypeIs("Tabby", pet: pet)
        thenPetAgeAsStringIs("5", pet: pet)
        
    }
    
    func testRemovingPetUpdatesCount() {
        givenAPetManager()
        
        // Add five pets
        for _ in 1...5 {
            givenAPet(RandomPet.random())
        }
        
        // remove two pets
        whenLastPetRemoved()
        whenLastPetRemoved()
        
        thenPetCountIs(3)
    }
    
    func testRemoveLastPetIsIdempotent() {
        givenAPetManager()
        givenAPet(RandomPet.random())
        whenLastPetRemoved()
        whenLastPetRemoved()
        whenLastPetRemoved()
        whenLastPetRemoved()
        
        thenPetCountIs(0)
    }

    func testRemoveFirstPetIsIdempotent() {
        givenAPetManager()
        givenAPet(RandomPet.random())
        whenFirstPetRemoved()
        whenFirstPetRemoved()
        whenFirstPetRemoved()
        whenFirstPetRemoved()
        thenPetCountIs(0)
    }
    
    //MARK: BDD utility methods
    
    func givenAPet(pet : Pet) {
        _petManager.addPet(pet, closure: nil)
    }
    
    func givenAPetManager() {
        _petManager = PetManager()
    }
    
    func whenLastPetRemoved() {
        _petManager.removeLastPet()
    }
    
    func whenFirstPetRemoved() {
        _petManager.removeFirstPet()
    }

    func thenPetCountIs (count : Int) {
        XCTAssertEqual(count, _petManager.petCount, "Pet count wrong")
    }
    
    func thenPetNameIs(name : String, pet : Pet) {
        XCTAssertEqual(name, pet.name,  "Expected pet name to be \(name) but was \(pet.name)")
    }
    
    func thenPetOwnerIs(owner : String, pet : Pet) {
        XCTAssertEqual(owner, pet.owner,  "Expected pet owner to be \(owner) but was \(pet.owner)")
    }
    
    func thenPetTypeIs(type : String, pet : Pet) {
        XCTAssertEqual(type, pet.type,  "Expected pet type to be \(type) but was \(pet.type)")
    }
    
    func thenPetAgeAsStringIs(age : String, pet : Pet) {
        XCTAssertEqual(age, pet.ageAsString,  "Expected pet age as string to be \(age) but was \(pet.ageAsString)")
    }

    
}
