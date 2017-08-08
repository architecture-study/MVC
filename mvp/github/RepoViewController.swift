//
//  ViewController.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDelegate {

    let tableView = UITableView(frame: .zero)
    var resource: Resource<[Repo]>
    var repoPresenter: ListPresenter<Repo>!
    
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
        
        tableView.delegate = self
        let repoView = ListView<Repo>(tableView: tableView, configure: { (cell, repo) in
            cell.textLabel?.text = repo.name
            cell.detailTextLabel?.text = String(repo.url)
        })
        
        repoPresenter = ListPresenter<Repo>(resource: resource, view: repoView)
        repoPresenter.getList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = repoPresenter.listView.data[indexPath.row]
        let issueVC = IssueViewController(resource: Issue.fromRepo(repo.name))
        navigationController?.pushViewController(issueVC, animated: true)
    }
}

