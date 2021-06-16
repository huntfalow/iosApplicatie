//
//  SearchViewController.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var inputDrinkg: UITextField!
    
    private let tableView: UITableView = {
       let table = UITableView()
       table.register(CollectionTableViewCell.self,
                      forCellReuseIdentifier: CollectionTableViewCell.identifier)
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
            for: indexPath) as? CollectionTableViewCell else {
                fatalError()
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SearchSegue" {
                   let searchResultsTableViewController = segue.destination as!SearchResultsTableViewController
                   searchResultsTableViewController.drink = inputDrinkg.text
               }
           
       }
}
