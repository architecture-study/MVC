//
//  RepoViewController.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView(frame: .zero)
    var resource : Resource<[Repo]>
    let viewModel = ViewModel<Repo>()
    var dataSource : TableViewDataSource<Repo>!
    
    init(resource: Resource<[Repo]>) {
        self.resource = resource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Architecture Study"
        view.addSubview(tableView)
        
        dataSource = TableViewDataSource<Repo>(tableView: tableView, viewModel: viewModel)
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        viewModel.loadResource(resource) {
           self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = viewModel.list![indexPath.row]
        let nextVC   = IssueViewController(resource: Issue.fromRepo(selected.toString()))
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
