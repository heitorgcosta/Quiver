//
//  QuiverFilteringTests.swift
//  QuiverTests
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverFilteringTests: XCTestCase {
    
 class TestClass {
        var stringValue: String
        var intValue: Int
        var floatValue: Float
        var doubleValue: Double
        var charValue: Character
        
        init(stringValue: String, intValue: Int, floatValue: Float, doubleValue: Double, charValue: Character) {
            self.stringValue = stringValue
            self.intValue = intValue
            self.floatValue = floatValue
            self.doubleValue = doubleValue
            self.charValue = charValue
        }
    }

    
    // Test array
    var array: [TestClass] = []
    
    override func setUp() {
        super.setUp()
        
        buildTestArray()
    }
    
    override func tearDown() {
        
        array = []
        
        super.tearDown()
    }
    
    func buildTestArray() {
        let item1 = TestClass(stringValue: "John Doe", intValue: 55, floatValue: 44.578, doubleValue: 21.999, charValue: "z")
        let item2 = TestClass(stringValue: "Hey Thor", intValue: 54, floatValue: 99.321, doubleValue: 33.333, charValue: "y")
        let item3 = TestClass(stringValue: "Sample Text", intValue: 53, floatValue: 21.999, doubleValue: 97.888, charValue: "k")
        let item4 = TestClass(stringValue: "Lorem Ipsum", intValue: 52, floatValue: 22.123, doubleValue: 99.098, charValue: "w")
        let item5 = TestClass(stringValue: "Gaby", intValue: 52, floatValue: 43.323, doubleValue: 65.753, charValue: "l")
        
        array = [item1, item2, item3, item4, item5]
    }
    
    func testFiltering() {
        var results = array.filter(by: \TestClass.stringValue, with: [.required()])
        XCTAssert(results.count == 5, "Expected 5 results, got \(results.count)")
        
        results = array.filter(by: \TestClass.stringValue, with: [.required(), .equal(to: "John Doe")])
        XCTAssert(results.count == 1, "Expected 1 result, got \(results.count)")
        
        results = array.filter(by: \TestClass.stringValue, with: [.length(min: 5)])
                        .filter(by: \TestClass.intValue, with: [.less(than: 54)])
        XCTAssert(results.count == 2, "Expected 2 results, got \(results.count)")
    }
    
}
