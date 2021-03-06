//
//  SearchResultsTableViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    let cocktailController = CocktailController()
    var drinks = [Drink]()
    var drink: String!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            title = drink.capitalized
            cocktailController.fetchDrinks(forDrink: drink)
            { (drinks) in
                if let drinks = drinks {
                    self.updateUI(with: drinks)
                }
            }
        }
    
      func updateUI(with drinks: [Drink]) {
            DispatchQueue.main.async {
                self.drinks = drinks
                self.tableView.reloadData()
            }
      }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
    "DrinkCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath:
    IndexPath) {
        let drinkItem = drinks[indexPath.row]
        cell.textLabel?.text = drinkItem.strDrink
        
    }
}
