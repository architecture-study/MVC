//
//  TableViewDataSource.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit
import Foundation

class TableViewDataSource<A>: NSObject, UITableViewDataSource {
    var tableView: UITableView
    var configure: (UITableViewCell, A) -> ()
    var dataSource: [A] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, configure: @escaping (UITableViewCell, A) -> ()) {
        self.tableView = tableView
        self.configure = configure
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        configure(cell!, dataSource[indexPath.row])
        return cell!
    }
}
