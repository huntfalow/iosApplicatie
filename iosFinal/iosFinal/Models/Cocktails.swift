//
//  Cocktails.swift
//  iosFinal
//
//  Created by Vincent on 18/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

struct WebsiteDescription: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let idDrink: String?
    let strDrink: String?
    let strInstructions: String
}
