//
//  ListView.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation
import UIKit

struct ListView<A> {
    var data: [A] = [] {
        didSet {
            dataSource.dataSource = data
        }
    }
    var tableView: UITableView
    var dataSource : TableViewDataSource<A>
        
    init(tableView: UITableView, configure: @escaping (UITableViewCell, A) -> ()) {
        self.dataSource = TableViewDataSource<A>(tableView: tableView, configure: configure)
        self.tableView = tableView
        self.tableView.dataSource = dataSource
    }
}
