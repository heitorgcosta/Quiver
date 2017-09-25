//
//  QuiverStringValidatorTests.swift
//  QuiverTests
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverStringValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLengthValidator() throws {
        let validator: Validator = .length(min: 3, max: 10)
        
        var result = try validator.validate(with: "Hi")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "The quick brown fox")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "Hi there")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
    }
    
}
