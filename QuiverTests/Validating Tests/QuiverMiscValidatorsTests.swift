//
//  QuiverValidatorsTests.swift
//  Quiver
//
//  Created by Heitor Costa on 18/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
import Quiver

class QuiverValidatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRequiredValidator() throws {
        let validator: Validator = .required()
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 32)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: "A sample string")
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testNegateValidator() throws {
        let validator: Validator = .not(.required())
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 32)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: "A sample string")
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
    }
    
    func testConditionalValidator() throws {
        var x = 10
        let validator: Validator = .if({ () -> Bool in
            return x < 5
        }, use: .required())
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 21)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        x = 2
        
        result = try validator.validate(with: nil)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 21)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
    }
}
