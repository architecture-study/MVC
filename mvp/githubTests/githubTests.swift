//
//  githubTests.swift
//  githubTests
//
//  Created by Mike Choi on 8/7/17.
//  Copyright © 2017 Mike Choi. All rights reserved.
//

import XCTest
@testable import github

class githubTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let mockData = ["url" : "sample", "name": "sample_name"]
        let mockRepo = Repo.init(dict: mockData)
        XCTAssert(mockRepo?.name == "sample_name")
    }
}
