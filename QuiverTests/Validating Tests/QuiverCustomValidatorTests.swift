//
//  QuiverCustomValidatorTests.swift
//  QuiverTests
//
//  Created by Luciano Almeida on 27/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverCustomValidatorTests: XCTestCase {
    
    
    func testCustom() throws {
        let validator : Validator = Validator.custom { (object) -> Bool in
            guard let string = object as? String else { return false }
            
            return string.contains("a")
        }
        
        var result = try validator.validate(with: "Hi")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "Hi i'm not here")
        XCTAssert(result == false, "Expected 'false' as a result, but got '\(result)'")
        
        result = try validator.validate(with: "Hi \"a\" character")
        XCTAssert(result == true, "Expected 'true' as a result, but got '\(result)'")
    }
    

    
}
