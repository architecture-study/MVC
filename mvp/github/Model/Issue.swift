//
//  Issue.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

struct Issue {
    let url: String
    let title: String
    let user: String
}

extension Issue {
    init?(dict: JSONDict) {
        guard let url = dict["url"] as? String, let title = dict["title"] as? String,
            let user_dict = dict["user"] as? JSONDict else { return nil }
        
        self.url = url
        self.title = title
        self.user = user_dict["login"] as! String
    }
    
    static func fromRepo(_ name: String) -> Resource<[Issue]> {
        let issueURL = URL(string: "https://api.github.com/repos/architecture-study/\(name)/issues")!
        let resource = Resource<[Issue]>(url: issueURL, parseJSON: { json in
            guard let dict = json as? [JSONDict] else { return nil }
            return dict.flatMap(Issue.init)
        })
        return resource
    }
}
