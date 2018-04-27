//
//  DBManager.swift
//  PostCode
//
//  Created by Patomphong Wongkalasin on 1/30/2560 BE.
//  Copyright © 2560 ReedUs Tech. All rights reserved.
//

import UIKit
import FMDB

class DBManager: NSObject {
    
    // MARK: Define Database FIELD
    let FIELD_POSTCODE_ID = "id"
    let FIELD_POSTCODE_PROVINCE = "province"
    let FIELD_POSTCODE_DISTRICT = "district"
    let FIELD_POSTCODE_SUBDISTRICT = "subdistrict"
    let FIELD_POSTCODE_POSTCODE = "postcode"
    
    // MARK: Define Database Properties
    static let shared: DBManager = DBManager()
    
    let databaseFileName = "postcode.sqlite"
    
    var pathToDatabase: String!
    
    var database: FMDatabase!
    
    override init() {
        super.init()
        // MARK: Define Database Path
        pathToDatabase = Bundle.main.path(forResource: "postcode", ofType: "sqlite")
    }
    
    // MARK: - Open Database
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    // MARK: - Load Data From Search Text
    func loadPostCode(searchText: String) -> [PostCodeInfo]! {
        var postcodes = [PostCodeInfo]()
        
        if openDatabase() && searchText.count > 0 {
            let query = "select * from postcode where " +
                FIELD_POSTCODE_PROVINCE + " like '%" + searchText + "%' or " +
                FIELD_POSTCODE_DISTRICT + " like '%" + searchText + "%' or " +
                FIELD_POSTCODE_SUBDISTRICT + " like '%" + searchText + "%' or " +
                FIELD_POSTCODE_POSTCODE + " like '%" + searchText + "%'"
            
            do {
                print(database)
                let results = try database.executeQuery(query, values: nil)
                
                while results.next() {
                    let postcode = PostCodeInfo(id: results.string(forColumn: FIELD_POSTCODE_ID),
                                                province: results.string(forColumn: FIELD_POSTCODE_PROVINCE),
                                                district: results.string(forColumn: FIELD_POSTCODE_DISTRICT),
                                                subdistrict: results.string(forColumn: FIELD_POSTCODE_SUBDISTRICT),
                                                postcode: results.string(forColumn: FIELD_POSTCODE_POSTCODE)
                    )
                    
                    postcodes.append(postcode)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
            database.close()
        }
        
        return postcodes
    }

}
