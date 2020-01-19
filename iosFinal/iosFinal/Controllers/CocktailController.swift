//
//  CocktailController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

class CocktailController {
    static let shared = CocktailController()
    let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mojito")!

    func fetchDrinks(forDrink drinkName: String, completion: @escaping ([Drink]?) -> Void)
    {
      let task = URLSession.shared.dataTask(with: baseURL)
              { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                if let data = data,
                let drinks = try? jsonDecoder.decode(Drinks.self,from: data) {
                    completion(drinks.drinks)
                } else {
                completion(nil)
                }
              }
              task.resume()
    }
}
