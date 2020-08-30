//
//  DrinkDetailsViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class DrinkDetailsViewController: UIViewController {
    var drinkItem: Drink!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet var instructionsText: UITextView!
    
    @IBAction func addToFavorites(_ sender: Any) {
        let favo = Favorite(idDrink: drinkItem.idDrink, strDrink: drinkItem.strDrink, strInstructions: drinkItem.strInstructions, strDrinkThumb: drinkItem.strDrinkThumb)
          
        let dialogMessage = UIAlertController(title: "Confirm", message: "You have added " + (favo.strDrink ?? "te") + " to your recipe book", preferredStyle: .alert)
        
  
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
   
        dialogMessage.addAction(ok)
      
        self.present(dialogMessage, animated: true, completion: nil)
        var favorites = Favorite.loadFavorites()
        favorites?.append(favo)
        Favorite.saveFavorites(favorites!)
        
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        print(drinkItem.strDrinkThumb)
        titleLabel.text = drinkItem.strDrink
        instructionsText.text = drinkItem.strInstructions
        drinkImage.load(urlString: drinkItem.strDrinkThumb!)
        drinkImage.layer.cornerRadius = 10
    }

}

