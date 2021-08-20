//
//  Cocktails.swift
//  iosFinal
//
//  Created by Vincent on 18/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

struct Drinks {
    let drinks: [Drink]
    
    init(drinks: [Drink]) {
            self.drinks = drinks
        }
}

struct Drink{
    let drinkId: Double?
    let drinkName: String?
    let drinkInstructions: String
    let drinkThumb: String?
  
    
    init(idDrink: Double, strDrink: String,strInstructions: String, strDrinkThumb: String ) {
            self.drinkId = idDrink
            self.drinkName = strDrink
            self.drinkInstructions = strInstructions
            self.drinkThumb = strDrinkThumb
        }
}
