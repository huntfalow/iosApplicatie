//
//  FavoritesTableViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
 
    var favorites = [Favorite]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    override func viewWillAppear(_ animated: Bool) {
           if let savedFavorites = Favorite.loadFavorites(){
                favorites = savedFavorites
                }else{
                print("tesst")
    }
        self.tableView.reloadData()
         
    }

    override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:
        "FavoriteCellIdentifier", for: indexPath)
        let favorite = favorites[indexPath.row]
        cell.textLabel?.text = favorite.strDrink
            configure(cell, forItemAt: indexPath)
            return cell
}
    override func tableView(_ tableView: UITableView, canEditRowAt
    indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit
    editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
    IndexPath) {
        if editingStyle == .delete {
            favorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Favorite.saveFavorites(favorites)
            
        }
    }
    
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath:IndexPath) {
    let favoriteItem = favorites[indexPath.row]
        cell.textLabel?.text = favoriteItem.strDrink
    }
     override func prepare(for segue: UIStoryboardSegue, sender:
       Any?) {
        
     
           if segue.identifier == "DrinkDetailSegueFromFavorites" {
               let drinkDetailsViewController = segue.destination
               as! DrinkDetailsViewController
               let index = tableView.indexPathForSelectedRow!.row
               let drinkCast = Drink(idDrink: favorites[index].idDrink!, strDrink: favorites[index].strDrink!, strInstructions: favorites[index].strInstructions)
              drinkDetailsViewController.drinkItem = drinkCast
            
        }
       }}

