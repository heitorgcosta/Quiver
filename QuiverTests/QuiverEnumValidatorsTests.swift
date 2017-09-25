//
//  QuiverEnumValidatorsTests.swift
//  QuiverTests
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverEnumValidatorsTests: XCTestCase {
    
    enum TestEnum: Int {
        case first
        case second
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnumEqual() throws {
        let validator: Validator = .equal(to: TestEnum.first)
        
        let nilResult = try validator.validate(with: nil)
        XCTAssert(nilResult == true, "Expected 'true', but got '\(nilResult)'")
        
        let firstResult = try validator.validate(with: TestEnum.first)
        XCTAssert(firstResult == true, "Expected 'true', but got '\(firstResult)'")
        
        let secondResult = try validator.validate(with: TestEnum.second)
        XCTAssert(secondResult == false, "Expected 'false', but got '\(secondResult)'")
    }
    
    func testEnumDifferent() throws {
        let validator: Validator = .different(to: TestEnum.first)
        
        let nilResult = try validator.validate(with: nil)
        XCTAssert(nilResult == true, "Expected 'true', but got '\(nilResult)'")
        
        let firstResult = try validator.validate(with: TestEnum.first)
        XCTAssert(firstResult == false, "Expected 'false', but got '\(firstResult)'")
        
        let secondResult = try validator.validate(with: TestEnum.second)
        XCTAssert(secondResult == true, "Expected 'true', but got '\(secondResult)'")
    }
    
}
