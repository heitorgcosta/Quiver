//
//  QuiverFloatingValidatorsTests.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverFloatingValidatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqualFloatingValidator() throws {
        let validator: Validator = .equal(to: 32.1)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 32.0)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 32.1)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testDifferentFloatingValidator() throws {
        let validator: Validator = .different(to: 25.87)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 25.87)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 25.8)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
}
