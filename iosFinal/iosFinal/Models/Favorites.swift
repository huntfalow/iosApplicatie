//
//  Favorites.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

struct Favorites: Codable {
    var drinks: [Drink]
    
    init(drinks: [Drink] = []) {
        self.drinks = drinks
    }
}
