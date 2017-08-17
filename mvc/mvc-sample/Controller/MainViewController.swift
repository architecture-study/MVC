//
//  ViewController.swift
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var repoHandler: RepoHandler
    var uiController: RepoUIController!
    let tableView = UITableView(frame: .zero)
    
    init(repoHandler: RepoHandler) {
        self.repoHandler = repoHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.repoHandler = RepoHandler()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        title = "REPOS"
        uiController = RepoUIController(tableView: tableView)
        repoHandler.delegate = uiController
        repoHandler.fetchRepos()
    }
}

