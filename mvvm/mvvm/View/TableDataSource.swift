//
//  TableDataSource.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<A: Presentable>: NSObject, UITableViewDataSource {
    var tableView: UITableView
    var viewModel: ViewModel<A>

    init(tableView: UITableView, viewModel: ViewModel<A>) {
        self.tableView = tableView
        self.viewModel = viewModel
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberofItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = viewModel.getText(for: indexPath)
        return cell!
    }
}
