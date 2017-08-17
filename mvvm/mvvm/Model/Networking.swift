//
//  Networking.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> (T?)
}

extension Resource {
    init(url: URL, parseJSON: @escaping (Any) -> (T?)) {
        self.url = url
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data)
            return json.flatMap(parseJSON)
        }
    }
}

final class WebService {
    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            let res = data.flatMap(resource.parse)
            completion(res)
            }.resume()
    }
}

