//
//  QuiverIntegerValidatorsTests.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverIntegerValidatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqualValidator() throws {
        let validator: Validator = .equal(to: 777)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 849)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 777)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testDifferentValidator() throws {
        let validator: Validator = .different(to: 654)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 654)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 555)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testGreaterValidator() throws {
        let validator: Validator = .greater(than: 300)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 654)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 555)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 300)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 250)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
    }
    
    func testLessValidator() throws {
        let validator: Validator = .less(than: 300)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 654)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 555)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 300)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 250)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testGreaterOrEqualValidator() throws {
        let validator: Validator = .greaterOrEqual(to: 300)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 654)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 555)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 300)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 250)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
    }
    
    func testLessOrEqualValidator() throws {
        let validator: Validator = .lessOrEqual(to: 300)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 654)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 555)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 300)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 250)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testBetweenValidator() throws {
        let validator: Validator = .between(50, and: 100)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 110)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 65)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testRangeValidator() throws {
        let validator: Validator = .from(50, to: 100)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 110)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 65)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
    }
    
    func testRangeTypeValidator() throws {
        let validator: Validator = .range(50..<100)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == false, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 110)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
    }
    
    func testClosedRangeTypeValidator() throws {
        let validator: Validator = .range(50...100)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: 110)
        XCTAssert(result == false, "Expected 'false', but result was '\(result)'")
        
    }
    
    func testPartialRangeUpToTypeValidator() throws {
        let validator: Validator = .range(..<50)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == false, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == false, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == true, "Expected 'false', but result was '\(result)'")
        
        result = try validator.validate(with: -1)
        XCTAssert(result == true, "Expected 'false', but result was '\(result)'")
        
    }
    
    func testPartialRangeThroughTypeValidator() throws {
        let validator: Validator = .range(...50)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 100)
        XCTAssert(result == false, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 50)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: -1)
        XCTAssert(result == true, "Expected 'false', but result was '\(result)'")
        
    }
    
    func testPartialRangeFromTypeValidator() throws {
        let validator: Validator = .range(30...)
        
        var result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 29)
        XCTAssert(result == false, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 1000)
        XCTAssert(result == true, "Expected 'true', but result was '\(result)'")
        
        result = try validator.validate(with: 30)
        XCTAssert(result == true, "Expected 'false', but result was '\(result)'")
        
    }
    
}
