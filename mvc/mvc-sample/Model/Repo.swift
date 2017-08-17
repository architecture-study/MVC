//
//  Repo.swift (MODEL)
//  mvc-sample
//
//  Created by Mike Choi on 7/30/17.
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
}
