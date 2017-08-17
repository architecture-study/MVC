//
//  ViewModel.swift
//  mvvm
//
//  Created by Mike Choi on 8/17/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

protocol Presentable {
    func toString() -> String
}

class ViewModel<A: Presentable>: NSObject {
    let sharedService = WebService()
    var list : [A]?
    
    func loadResource(_ resource: Resource<[A]>, completion: @escaping () -> ()) {
        sharedService.load(resource: resource) { data in
            if let data = data {
                self.list = data
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberofItems() -> Int {
        return list?.count ?? 0
    }
    
    func getText(for indexPath: IndexPath) -> String {
        guard let val = list?[indexPath.row] else { return "" }
        return val.toString()
    }
}
