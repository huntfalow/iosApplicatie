//
//  SearchViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var inputDrinkg: UITextField!
    
    private let tableView: UITableView = {
       let table = UITableView()
       table.register(CollectionTableViewCell.self,
                      forCellReuseIdentifier: CollectionTableViewCell.identifier)
       return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
    CollectionTableViewCellViewModel(
        viewModels: [
            TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Google", backgroundColor: .systemYellow),
            TileCollectionViewCellViewModel(name: "AMD", backgroundColor: .systemRed)
        ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let rect = CGRect(x: 10,y: 10,width: view.bounds.width,height: 250)
        tableView.frame = rect
        
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let viewModel = viewModels[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath) as? CollectionTableViewCell else {
                fatalError()
        }
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SearchSegue" {
                   let searchResultsTableViewController = segue.destination as!SearchResultsTableViewController
                   searchResultsTableViewController.drink = inputDrinkg.text
               }
           
       }
}
