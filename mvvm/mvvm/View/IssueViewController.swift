//
//  IssueViewController.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    var resource : Resource<[Issue]>
    let viewModel = ViewModel<Issue>()
    var dataSource : TableViewDataSource<Issue>!
    
    init(resource: Resource<[Issue]>) {
        self.resource = resource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Issues"
        view.addSubview(tableView)
        
        dataSource = TableViewDataSource<Issue>(tableView: tableView, viewModel: viewModel)
        tableView.dataSource = dataSource
        
        viewModel.loadResource(resource) {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HEY")
    }
}

