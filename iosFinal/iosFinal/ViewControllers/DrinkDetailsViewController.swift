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
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        titleLabel.text = drinkItem.strDrink
        instructionsText.text = drinkItem.strInstructions
    }

}

