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
  
    let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?")!
    
    let baseURLRandom = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/random.php")

    

   
    func fetchDrinks(forDrink drinkName: String, completion: @escaping ([Drink]?) -> Void)
    {
        let query: [String: String] = [
            "s": drinkName
        ]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url)
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
    
    func fetchRandomDrinks(completion: @escaping ([Drink]?) -> Void)
    {
      let task = URLSession.shared.dataTask(with: baseURLRandom!)
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
