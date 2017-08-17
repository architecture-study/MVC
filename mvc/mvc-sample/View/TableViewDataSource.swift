//
//  TableViewDataSource.swift
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class TableViewDataSource : NSObject, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView
    
    var dataSource: [Repo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].name
        return cell
    }
}
