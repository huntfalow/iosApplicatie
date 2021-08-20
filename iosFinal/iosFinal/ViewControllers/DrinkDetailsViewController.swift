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
    let paperPlane = UIImage(systemName: "paperplane.fill");
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet var instructionsText: UITextView!
    @IBOutlet var HeartIcon: UIBarButtonItem!
    @IBAction func addToFavorites(_ sender: Any) {
       
        let favorites = Favorite.loadFavorites()
        var saved = false
        let favo = Favorite(idDrink: drinkItem.idDrink, strDrink: drinkItem.strDrink, strInstructions: drinkItem.strInstructions, strDrinkThumb: drinkItem.strDrinkThumb)
    
        if(favorites?.contains(favo) == true){
            saved = true
        }else{
            saved = false
        }

        let dialogMessage = UIAlertController(title: "Confirm", message: "You have added " + (favo.strDrink ?? "te") + " to your favorites", preferredStyle: .alert)
    
        let dialogMessage2 = UIAlertController(title: "Confirm", message: "Are you sure you want to remove this from your favorites?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         })
         let ok2 = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         var favorites = Favorite.loadFavorites()
              
         if let index = favorites!.firstIndex(of: favo) {
                           favorites?.remove(at: index)
            }
             Favorite.saveFavorites(favorites!)
         })
          let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
              }
        
        dialogMessage.addAction(ok)
        dialogMessage2.addAction(ok2)
        dialogMessage2.addAction(cancel)
        
        if(saved == false){
        self.present(dialogMessage, animated: true, completion: nil)
        var favorites = Favorite.loadFavorites()
            
        if(favorites == nil){
            var favosWhenEmpty = [Favorite]()
            favosWhenEmpty.append(favo)
            favorites = favosWhenEmpty
        }
        else{
            favorites?.append(favo)
        }
            
       
        Favorite.saveFavorites(favorites!)
            saved = true
            
       }else{
            
        self.present(dialogMessage2, animated: true, completion: nil)
            
       }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = drinkItem.strDrink
        instructionsText.text = drinkItem.strInstructions
        drinkImage.load(urlString: drinkItem.strDrinkThumb!)
        drinkImage.layer.cornerRadius = 10
                
    }

}

