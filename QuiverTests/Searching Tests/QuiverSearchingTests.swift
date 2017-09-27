//
//  QuiverTests.swift
//  QuiverTests
//
//  Created by Heitor Costa on 25/08/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverSearchingTests: XCTestCase {
    
    // Test class implementing the Searchable Protocol
    class TestClass: Searchable {
        var stringValue: String
        var intValue: Int
        var floatValue: Float
        var doubleValue: Double
        var charValue: Character
        var optionalIntValue: Int? = nil
        var optionalFloatValue: Float? = nil
        var optionalDoubleValue: Double? = 31
        var optionalStringValue: String? = "The cake is a lie"
        var optionalCharValue: Character? = "p"
        
        init(stringValue: String, intValue: Int, floatValue: Float, doubleValue: Double, charValue: Character) {
            self.stringValue = stringValue
            self.intValue = intValue
            self.floatValue = floatValue
            self.doubleValue = doubleValue
            self.charValue = charValue
        }
        
        func searchableFields() -> [Any?] {
            return [stringValue,
                    intValue,
                    floatValue,
                    doubleValue,
                    charValue,
                    optionalStringValue,
                    optionalIntValue,
                    optionalFloatValue,
                    optionalDoubleValue,
                    optionalCharValue]
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
    
    // Test simple searches
    func testSimpleObjectSearch() {
        
        var filtered = array.search(withText: "John Doe")
        XCTAssert(filtered.count == 1, "Expected 1 item on search, found \(filtered.count)")
        
        filtered = array.search(withText: "o")
        XCTAssert(filtered.count == 3, "Expected 3 items on search, found \(filtered.count)")
        
        filtered = array.search(withText: "gwoguhsojgw")
        XCTAssert(filtered.count == 0, "Expected 0 items on search, found \(filtered.count))")
        
        filtered = array.search(withText: "52")
        XCTAssert(filtered.count == 2, "Expected 2 items on search, found \(filtered.count)")
        
        filtered = array.search(withText: "2015")
        XCTAssert(filtered.count == 0, "Expected 0 items on search, found \(filtered.count)")
        
        filtered = array.search(withText: "05/12")
        XCTAssert(filtered.count == 0, "Expected 0 items on search, found \(filtered.count)")
        
        filtered = array.search(withText: "z")
        XCTAssert(filtered.count == 1, "Expected 1 item on search, found \(filtered.count)")
        
        filtered = array.search(withText: "y")
        XCTAssert(filtered.count == 2, "Expected 2 items on search, found \(filtered.count)")
    }
    
    //Search optional field
    func testOptionalSearch() {
        var filtered = array.search(withText: "cake")
        XCTAssert(filtered.count == 5, "Expected 1 item on search, found \(filtered.count)")
        
        filtered = array.search(withText: "31")
        XCTAssert(filtered.count == 5, "Expected 1 item on search, found \(filtered.count)")
        
        filtered = array.search(withText: "truth")
        XCTAssert(filtered.count == 0, "Expected 0 item on search, found \(filtered.count)")
        
        filtered = array.search(withText: "p")
        XCTAssert(filtered.count == 5, "Expected 5 items on search, found \(filtered.count)")
    }
    
    // Nested Search
    func testNestedFields() {
        struct Dog: Searchable {
            var name: String
            var age: Int
            
            func searchableFields() -> [Any?] {
                return [name, age]
            }
        }
        struct Person: Searchable {
            var name: String
            var age: Int
            var dog: Dog
            
            func searchableFields() -> [Any?] {
                return [name, age, dog]
            }
        }
        
        let person = Person(name: "John", age: 23, dog: Dog(name: "Rex", age: 2))
        
        let result = [person].search(withText: "Rex")
        XCTAssert(result.count == 1, "Expected 1 result, found \(result.count)")
        
        let result2 = [person].search(withText: "4")
        XCTAssert(result2.count == 0, "Expected 0 results, found \(result.count)")
    }
    
    func testCaseSensitiveSearch() {
        // Explicit no case sensitive
        var filtered = array.search(withText: "john", caseSensitive: false)
        XCTAssert(filtered.count == 1, "Expected 1 result, but found \(filtered.count)")
        
        // Explicit case sensitive
        filtered = array.search(withText: "john", caseSensitive: true)
        XCTAssert(filtered.count == 0, "Expected 0 result, but found \(filtered.count)")
        
        // Defaults as no case sensitive
        filtered = array.search(withText: "john")
        XCTAssert(filtered.count == 1, "Expected 1 result, but found \(filtered.count)")
    }
    
    // Test search performance over 20 objects
    func testLightSearchPerformance() {
        
        array.append(contentsOf: array) // 10
        array.append(contentsOf: array) // 20
        
        self.measure {
            var _ = self.array.search(withText: "52")
        }
    }
    
    // Test search performance over 160 objects
    func testMediumSearchPerformance() {
        
        array.append(contentsOf: array) // 10
        array.append(contentsOf: array) // 20
        array.append(contentsOf: array) // 40
        array.append(contentsOf: array) // 80
        array.append(contentsOf: array) // 160
        
        self.measure {
            var _ = self.array.search(withText: "52")
        }
    }
    
    // Test search performance over 1280 objects
    func testHeavySearchPerformance() {
        
        array.append(contentsOf: array) // 10
        array.append(contentsOf: array) // 20
        array.append(contentsOf: array) // 40
        array.append(contentsOf: array) // 80
        array.append(contentsOf: array) // 160
        array.append(contentsOf: array) // 320
        array.append(contentsOf: array) // 640
        array.append(contentsOf: array) // 1280
        
        self.measure {
            var _ = self.array.search(withText: "52")
        }
    }
    
    // Test search performance over 10240 objects
    func testSuperHeavySearchPerformance() {
        
        array.append(contentsOf: array) // 10
        array.append(contentsOf: array) // 20
        array.append(contentsOf: array) // 40
        array.append(contentsOf: array) // 80
        array.append(contentsOf: array) // 160
        array.append(contentsOf: array) // 320
        array.append(contentsOf: array) // 640
        array.append(contentsOf: array) // 1280
        array.append(contentsOf: array) // 2560
        array.append(contentsOf: array) // 5120
        array.append(contentsOf: array) // 10240
        
        self.measure {
            var _ = self.array.search(withText: "52")
        }
    }
}
