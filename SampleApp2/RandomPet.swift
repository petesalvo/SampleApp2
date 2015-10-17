//
//  RandomPet.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import Foundation

public class RandomPet {
    
    public class func random() -> Pet {
        let randomAge = Int(arc4random_uniform(13)) + 1
        let randomPic = "petPic\(Int(arc4random_uniform(7)) + 1)"
        let pet : Pet = Pet(name: RandomName.randomPetName(), owner : RandomName.randomHumanName(), type : RandomName.randomPetType(), age: randomAge, imageName: randomPic)
        return pet
    }
}

// I didn't know something like this existed...but it does.
// http://listofrandomnames.com/

class RandomName {
    
    class func randomHumanName() -> String {
        let randomNames : [String] =
        ["Tennille Bragg",
            "Eleanore Levitt",
            "Eugene Heidenreich",
            "Madaline Cason",
            "Blanche Maycock",
            "Dominick Gabor",
            "Lera Sutto",
            "Clifford Portman",
            "Marketta Herr",
            "Cordelia Wideman",
            "Natasha Eggers",
            "Britt Kauppi",
            "Ervin Pinto",
            "Brittny Tann",
            "Annika Alvear",
            "Rosamaria Pavlik",
            "Mi Brisker",
            "Karine Stines",
            "Lillie Alston",
            "Dave Parnell"]
        
        let index = Int(arc4random_uniform(UInt32(randomNames.count)))
        return randomNames[index]
    }
    
    class func randomPetName() -> String {
        let randomNames : [String] =
            ["Cinthia",
            "Ludivina",
            "Candida",
            "Martine",
            "Sammie",
            "Rey",
            "Nick",
            "Wally",
            "Clayton",
            "Anibal",
            "Dorthey",
            "Darron",
            "Fairy",
            "Danielle",
            "Andree",
            "Cayla",
            "Sammy",
            "Tatum",
            "Phuong",
            "Clarissa"]
        
        let index = Int(arc4random_uniform(UInt32(randomNames.count)))
        return randomNames[index]
    }
    
    class func randomPetType() -> String {
        let randomNames : [String] =
            ["English Origin",
            "Shorthair",
            "Longhair",
            "Spotted",
            "Extra Fancy",
            "Rare",
            "Ruffled"]
        
        let index = Int(arc4random_uniform(UInt32(randomNames.count)))
        return randomNames[index]
    }

}
