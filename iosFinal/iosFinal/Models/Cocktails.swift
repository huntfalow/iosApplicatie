//
//  Cocktails.swift
//  iosFinal
//
//  Created by Vincent on 18/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

struct Drinks: Codable {
    let drinks: [Drink]
    
    init(drinks: [Drink]) {
            self.drinks = drinks
        }
}

struct Drink: Codable {
    let idDrink: String?
    let strDrink: String?
    let strInstructions: String
    
    init(idDrink: String, strDrink: String,strInstructions: String ) {
            self.idDrink = idDrink
            self.strDrink = strDrink
            self.strInstructions = strInstructions
        }
}
