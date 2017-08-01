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
    let id: Int
    let name: String
}

extension Repo {
    init?(dict: JSONDict) {
        guard let id = dict["id"] as? Int, let name = dict["name"] as? String else { return nil }
        self.id = id
        self.name = name
    }
}
