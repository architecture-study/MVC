//
//  RepoUIController.swift
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit


final class RepoUIController: RepoDelegate {
    let tableDataSource: TableViewDataSource
    
    var repos: [Repo] = [] {
        didSet {
            tableDataSource.dataSource = repos
        }
    }
    
    init(tableView: UITableView) {
        self.tableDataSource = TableViewDataSource(tableView: tableView)
        tableView.dataSource = tableDataSource
    }
}
