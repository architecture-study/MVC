//
//  IssueViewController.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    var resource: Resource<[Issue]>
    var issueView: ListView<Issue>!
    
    init(resource: Resource<[Issue]>) {
        self.resource = resource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addIssue(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Issue", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { txtField in txtField.text = "" }
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            print("Added!")
        }))
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addIssue(sender:)))
        navigationItem.rightBarButtonItem = rightBarButton
        title = "Issues"
        
        issueView = ListView<Issue>(tableView: tableView, configure: { (cell, issue) in
            cell.textLabel?.text = issue.title
            cell.detailTextLabel?.text = issue.user
        })
        let presenter = ListPresenter<Issue>(resource: resource, view: issueView)
        presenter.getList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
}

