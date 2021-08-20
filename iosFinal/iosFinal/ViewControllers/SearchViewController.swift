//
//  SearchViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var inputDrinkg: UITextField!
    var randomDrinks = [Drink]()
    var callCount = 0
    
//    private let tableView: UITableView = {
//       let table = UITableView()
//       table.register(CollectionTableViewCell.self,
//        forCellReuseIdentifier: CollectionTableViewCell.identifier)
//       return table
//    }()
    
//    private let viewModels: [CollectionTableViewCellViewModel] = [
//    CollectionTableViewCellViewModel(
//        viewModels: [
//            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemBlue),
//            TileCollectionViewCellViewModel(name: "Google", backgroundColor: .systemYellow),
//            TileCollectionViewCellViewModel(name: "AMD", backgroundColor: .systemRed)
//        ]
//        )
//    ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
      //  view.addSubview(tableView)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
       
   
       // tableView.dataSource = self
       // tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.randomDrinks.removeAll()
        self.callCount = 0
        self.collectionView.reloadData()
        getRandomData()
    }
    
    
    func getRandomData(){
        
        CocktailController.shared.fetchRandomDrinks()
        { (drinks) in
            if let drinks = drinks {
                self.randomDrinks.append(contentsOf: drinks)
                self.callCount = self.callCount + 1
                if(self.callCount < 5){
                    self.getRandomData()
                }
                else{
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
              //  self.mapRandomDrinks(with: drinks)
            }
        }
    }
  
    
    func mapRandomDrinks(with drinks: [Drink]) {
               DispatchQueue.main.async {
                   self.randomDrinks = drinks
                print("---=-=-=-=-=-==-=-=-\(self.randomDrinks.count)")
                self.collectionView.reloadData()
               }
        }
    
    
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            self.collectionView.reloadData()
        } else {
            self.collectionView.reloadData()
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let rect = CGRect(x: 10,y: 10,width: view.bounds.width,height: 250)
//       // tableView.frame = rect
//    }
//
   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let viewModel = viewModels[indexPath.row]
//            guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: CollectionTableViewCell.identifier,
//            for: indexPath) as? CollectionTableViewCell else {
//                fatalError()
//        }
//        cell.configure(with: viewModel)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return view.frame.size.width / 2
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SearchSegue" {
                   let searchResultsTableViewController = segue.destination as!SearchResultsTableViewController
                   searchResultsTableViewController.drink = inputDrinkg.text
               }
           
       }
}

extension SearchViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.randomDrinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TileCollectionViewCell", for: indexPath) as! TileCollectionViewCell
        cell.configureData(image: self.randomDrinks[indexPath.row].strDrinkThumb ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(self.randomDrinks.count == 1){
            return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        }
        else if(self.randomDrinks.count == 2){
            return CGSize(width: self.collectionView.frame.width / 2, height: self.collectionView.frame.height)
        }
        else{
            return CGSize(width: self.collectionView.frame.width / 3, height: self.collectionView.frame.height)
        }
       
    }
    
    
}
