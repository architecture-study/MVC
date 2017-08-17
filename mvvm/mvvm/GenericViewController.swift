//
//  GenericViewController.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation
import UIKit

class GenericViewController<A: Presentable>: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView(frame: .zero)
    var resource : Resource<[A]>!
    let viewModel = ViewModel<A>()
    var dataSource : TableViewDataSource<A>!
    
    init(resource: Resource<[A]>, title: String) {
        super.init(nibName: nil, bundle: nil)
        self.resource = resource
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        dataSource = TableViewDataSource<A>(tableView: tableView, viewModel: viewModel)
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
        let vcTitle = selected.toString()
        let nextVC   = GenericViewController<Issue>(resource: Issue.fromRepo(vcTitle), title: vcTitle)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
