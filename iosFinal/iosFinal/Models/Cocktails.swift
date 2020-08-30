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
    let strDrinkThumb: String?
  
    
    init(idDrink: String, strDrink: String,strInstructions: String, strDrinkThumb: String ) {
            self.idDrink = idDrink
            self.strDrink = strDrink
            self.strInstructions = strInstructions
            self.strDrinkThumb = strDrinkThumb
        }
}
