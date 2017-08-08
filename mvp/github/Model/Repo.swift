//
//  Repo.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

typealias JSONDict = [String:Any]

struct Repo {
    let url: String
    let name: String
}

extension Repo {
    init?(dict: JSONDict) {
        guard let url = dict["url"] as? String, let name = dict["name"] as? String else { return nil }
        self.url = url
        self.name = name
    }
    
    static let foobarURL = URL(string: "https://api.github.com/users/architecture-study/repos")!
    static let all = Resource<[Repo]>(url: foobarURL, parseJSON: { json in
        guard let dict = json as? [JSONDict] else { return nil }
        return dict.flatMap(Repo.init)
    })
}
