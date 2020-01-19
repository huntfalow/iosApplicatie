//
//  FavoritesTableViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    var favorites = Favorites()
    override func viewDidLoad() {
        super.viewDidLoad()

    }


   override func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return favorites.drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
    indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:
        "FavoriteCellIdentifier", for: indexPath)
            configure(cell, forItemAt: indexPath)
            return cell
}
    
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath:IndexPath) {
    let favoriteItem = favorites.drinks[indexPath.row]
        cell.textLabel?.text = favoriteItem.strDrink
    }
}

