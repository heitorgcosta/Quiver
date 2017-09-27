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
    }
    
    override func tearDown() {
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
    
    func testRegexValidator() throws {
        let validator: Validator = .regex(pattern: "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$")
        
        var result = try validator.validate(with: "")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "0123456789")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "The quick brown fox")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "email@mail.com")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
    }
    
    func testEmailValidator() throws {
        let validator: Validator = .email()
        
        var result = try validator.validate(with: "")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "0123456789")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "The quick brown fox")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "email@mail.com")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
    }
    
    func testAlphabeticValidator() throws {
        let validator: Validator = .alphabetic()
        
        var result = try validator.validate(with: "")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "0123456789")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "jfdsj234njvsnjv")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "hfdicnscwtewg")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
    }
    
    func testNumericValidator() throws {
        let validator: Validator = .numeric()
        
        var result = try validator.validate(with: "")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "0123456789")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "jfdsj234njvsnjv")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "hfdicnscwtewg")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
    }
    
    func testAlphaNumericValidator() throws {
        let validator: Validator = .alphaNumeric()
        
        var result = try validator.validate(with: "")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: nil)
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "0123456789")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "jfdsj234njvsnjv")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "hfdicnscwtewg")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "idn91941&jfwekf")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
    }
}
