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
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
                    var allDrinks = [Drink]()
                    let drinks = json["drinks"] as! [Dictionary<String, AnyObject>]
                    for drink in drinks{
                        let drink = Drink(idDrink: drink["idDrink"]!.doubleValue, strDrink: drink["strDrink"] as! String, strInstructions: drink["strInstructions"] as! String, strDrinkThumb: drink["strDrinkThumb"] as! String)
                        allDrinks.append(drink)
                    }
                   completion(allDrinks)
                } catch {
                    completion(nil)
                    print("JSON Serialization error")
                }
            }
              }
              task.resume()
    }
    
    func fetchRandomDrinks(completion: @escaping ([Drink]?) -> Void)
    {
        let task = URLSession.shared.dataTask(with: baseURLRandom!)
              { (data, response, error) in
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, AnyObject>
                    var allDrinks = [Drink]()
                    let drinks = json["drinks"] as! [Dictionary<String, AnyObject>]
                    for drink in drinks{
                        let value = Drink(idDrink: drink["idDrink"]!.doubleValue, strDrink: drink["strDrink"] as! String, strInstructions: drink["strInstructions"] as! String, strDrinkThumb: drink["strDrinkThumb"] as! String)
                        allDrinks.append(value)
                    }
                   completion(allDrinks)
                } catch {
                    completion(nil)
                    print("JSON Serialization error")
                }
            }
              }
              task.resume()
    }
    
    
}
