//
//  PostCodeTableViewController.swift
//  PostCode
//
//  Created by Patomphong Wongkalasin on 1/29/2560 BE.
//  Copyright © 2560 ReedUs Tech. All rights reserved.
//

import UIKit
import FMDB

//Define Model
struct PostCodeInfo {
    var id: String!
    var province: String!
    var district: String!
    var subdistrict: String!
    var postcode: String!
}

class PostCodeTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var postcodes = [PostCodeInfo]()
    
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postcodes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //Define Custom Tableview Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCodeTableViewCell
        
        //Define PostCode Variable
        let province = postcodes[indexPath.row].province!
        let district = postcodes[indexPath.row].district!
        let subdistrict = postcodes[indexPath.row].subdistrict!
        let postcode = postcodes[indexPath.row].postcode!
        
        //Set Label Text
        cell.labelAddress.text = "\(subdistrict) \(district)"
        cell.labelProvince.text = "\(province)"
        cell.labelPostCode.text = "\(postcode)"

        return cell
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
        postcodes = DBManager.shared.loadPostCode(searchText: searchText)
        tableView.reloadData()
    }
    
}
