//
//  RepoController.swift
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

protocol RepoDelegate: class {
    var repos: [Repo] { get set }
}

protocol RepoHandler: class {
    var delegate: RepoDelegate? { get set }
    func fetchRepos()
}

final class RepoPresenter: RepoHandler {
    var delegate: RepoDelegate?
    
    func fetchRepos() {
        guard let delegate = self.delegate else { fatalError("No existing delegate to call from") }
        
        let appleURL = URL(string: "https://api.github.com/users/apple/repos")!
        let repoResource = Resource<[Repo]>(url: appleURL, parseJSON: { json in
            guard let dict = json as? [JSONDict] else { return nil }
            return dict.flatMap(Repo.init)
        })
        

        /* TODO: Use `Result<T>` enum to store data */
        WebService().load(resource: repoResource) { repos in
            if let repos = repos {
                delegate.repos = repos
            } else {
                delegate.repos = []
            }
        }
    }
}
