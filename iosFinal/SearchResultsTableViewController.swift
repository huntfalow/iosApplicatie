//
//  SearchResultsTableViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    var drinks = [Drink]()
    var drink: String!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            title = drink.capitalized
            CocktailController.shared.fetchDrinks(forDrink: drink.lowercased())
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

    override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
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
        cell.detailTextLabel?.text = ""
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
    Any?) {
        if segue.identifier == "DrinkDetailSegue" {
            let drinkDetailsViewController = segue.destination
            as! DrinkDetailsViewController
            let index = tableView.indexPathForSelectedRow!.row
            drinkDetailsViewController.drinkItem = drinks[index]
        }
    }
}
