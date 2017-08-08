//
//  ListPresenter.swift
//  github
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import Foundation

class ListPresenter<A> {
    var resource: Resource<[A]>
    var listView: ListView<A>
    let sharedService = WebService()
    
    init(resource: Resource<[A]>, view: ListView<A>) {
        self.resource = resource
        listView = view
    }
    
    func getList() {
        sharedService.load(resource: resource) { listData in
            guard let listData = listData else { return }
            self.listView.data = listData
        }
    }
}
