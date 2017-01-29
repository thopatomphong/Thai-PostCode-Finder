//
//  PostCodeTableViewController.swift
//  PostCode
//
//  Created by Patomphong Wongkalasin on 1/29/2560 BE.
//  Copyright © 2560 ReedUs Tech. All rights reserved.
//

import UIKit

class PostCodeTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "ตำบล, อำเภอ, จังหวัด, รหัสไปรษณีย์"
        
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension PostCodeTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let searchText = searchBar.text else {
            return
        }
        
        print("Search : \(searchText)")
    }
    
}
