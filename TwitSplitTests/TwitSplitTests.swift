//
//  TwitSplitTests.swift
//  TwitSplitTests
//
//  Created by user on 24/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import XCTest
@testable import TwitSplit

class TwitSplitTests: XCTestCase {
    let MAX_SPLIT_MESSAGE = 50
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testLessThanOrEqual() {
        let message = "Post each chunk as a separate message"
        let expected = ["Post each chunk as a separate message"]
        let output = Utils.splitMessage(message: message, limit: MAX_SPLIT_MESSAGE)
        XCTAssertEqual(output, expected)
    }
    func testLessThanOrEqualNonwhitespace() {
        let message = "Posteachchunkasaseparatemessage"
        let expected = ["Posteachchunkasaseparatemessage"]
        let output = Utils.splitMessage(message: message, limit: MAX_SPLIT_MESSAGE)
        XCTAssertEqual(output, expected)
    }
    
    func testGreaterThan() {
        let message = "I can't believe Tweeter now supports chunking my messages, so I don't have to do it myself."
        let expected = ["1/2 I can\'t believe Tweeter now supports chunking", "2/2 my messages, so I don\'t have to do it myself."]
        let output = Utils.splitMessage(message: message, limit: MAX_SPLIT_MESSAGE)
        XCTAssertEqual(output, expected)
    }
    func testGreaterThanNonwhitespace() {
        let message = "Ican'tbelieveTweeternowsupportschunkingmymessages,soIdon'thavetodoitmyself."
        let expected = [String]()
        let output = Utils.splitMessage(message: message, limit: MAX_SPLIT_MESSAGE)
        XCTAssertEqual(output, expected)
    }
    
    
}
