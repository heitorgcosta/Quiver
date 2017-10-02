//
//  QuiverValidatableTests.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import XCTest
@testable import Quiver

class QuiverValidatableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidationMapping() {
        struct DummyStruct {
            var dummyVar: String?
        }
        
        let mapper = ValidatorMapper(excluding: [])
        mapper[\DummyStruct.dummyVar] = [.required(), .greater(than: 5), .between(4, and: 6)]
        
        let validators = mapper[\DummyStruct.dummyVar]
        
        let count = validators.count
        XCTAssert(count == 3, "Expected 3 validators, found \(count)")
        
        let required = validators[0]
        XCTAssert(required is RequiredValidator, "Expected first validator as RequiredValidator, found \(type(of: required))")
        
        let greater = validators[1]
        XCTAssert(greater is ComparatorValidator<Int>, "Expected second validator as ComparatorValidator<Int>, found \(type(of: greater))")
        
        let between = validators[2]
        XCTAssert(between is BetweenComparator<Int>, "Expected third validator as BetweenComparator<Int>, found \(type(of: between))")
    }
    
    func testSimpleValidation() {
        struct Person: Validatable {
            var name: String?
            
            init(name: String?) {
                self.name = name
            }
            
            func validations(with mapper: ValidatorMapper) {
                mapper[\Person.name] = [.required(), .length(min: 4)]
            }
        }
        
        let unnamedPerson = Person(name: nil)
        let unnamedPersonResult = unnamedPerson.validate()
        XCTAssert(unnamedPersonResult.success == false, "Expected 'false' as result, got '\(unnamedPersonResult.success)'")
        XCTAssert(unnamedPersonResult.error!.items.count == 1, "Expected 1 error, got \(unnamedPersonResult.error!.items.count)")
        
        let bob = Person(name: "Bob")
        let bobResult = bob.validate()
        XCTAssert(bobResult.success == false, "Expected 'false' as result, got '\(bobResult.success)'")
        XCTAssert(bobResult.error!.items.count == 1, "Expected 1 error, got \(bobResult.error!.items.count)")
        
        let john = Person(name: "John")
        let johnResult = john.validate()
        XCTAssert(johnResult.success == true, "Expected 'true' as result, got \(johnResult.success)")
        XCTAssert(johnResult.error == nil, "Expected error being nil, but got \(johnResult.error!)")
    }
    
    func testValidationWithMessage() {
        struct Person: Validatable {
            var name: String?
            
            init(name: String?) {
                self.name = name
            }
            
            func validations(with mapper: ValidatorMapper) {
                mapper[\Person.name] = [.required(message: "Name is required"),
                                        .length(min: 4, message: "Name should be at least 4 characters long.")]
            }
        }
        
        let personNil = Person(name: nil)
        let nilResult = personNil.validate()
        let nilMessage = nilResult.error!.firstItem?.message
        XCTAssertNotNil(nilMessage, "Expected message to not be nil, but it is.")
        XCTAssert(nilMessage! == "Name is required", "Expected message passed through argument, but got '\(nilMessage!)'")
        
        let personAna = Person(name: "Ana")
        let anaResult = personAna.validate()
        let anaMessage = anaResult.error!.firstItem?.message
        XCTAssertNotNil(anaMessage, "Expected message to not be nil, but it is.")
        XCTAssert(anaMessage! == "Name should be at least 4 characters long.", "Expected message passed through argument, but got '\(anaMessage!)'")
        
        let personJohn = Person(name: "John")
        let johnResult = personJohn.validate()
        let johnError = johnResult.error
        XCTAssertNil(johnError, "Expected error to be nil, but it isn't.")
    }
    
    func testValidationExcludingKeyPath() {
        struct Person: Validatable {
            var name: String?
            var age: Int?
            
            init(name: String?, age: Int?) {
                self.name = name
                self.age = age
            }
            
            func validations(with mapper: ValidatorMapper) {
                mapper[\Person.name] = [.required(message: "Name is required"),
                                        .length(min: 4, message: "Name should be at least 4 characters long.")]
                
                mapper[\Person.age] = [.required(message: "Age is required"),
                                       .greater(than: 3, message: "Age should be greater than 3")]
            }
        }
        
        let personNil = Person(name: nil, age: 2)
        let nilResult = personNil.validate(excluding: \Person.age)
        let nilMessage = nilResult.error!.firstItem?.message
        XCTAssertNotNil(nilMessage, "Expected message to not be nil, but it is.")
        XCTAssert(nilMessage! == "Name is required", "Expected message passed through argument, but got '\(nilMessage!)'")
        
        let personAna = Person(name: "Ana", age: nil)
        let anaResult = personAna.validate(excluding: \Person.age)
        let anaMessage = anaResult.error!.firstItem?.message
        XCTAssertNotNil(anaMessage, "Expected message to not be nil, but it is.")
        XCTAssert(anaMessage! == "Name should be at least 4 characters long.", "Expected message passed through argument, but got '\(anaMessage!)'")
        
        let personJohn = Person(name: "John", age: 1)
        let johnResult = personJohn.validate(excluding: \Person.age)
        let johnError = johnResult.error
        XCTAssertNil(johnError, "Expected error to be nil, but it isn't.")
    }
    
    func testValidationExcludingKeyPaths() {
        struct Person: Validatable {
            var name: String?
            var age: Int?
            
            init(name: String?, age: Int?) {
                self.name = name
                self.age = age
            }
            
            func validations(with mapper: ValidatorMapper) {
                mapper[\Person.name] = [.required(message: "Name is required"),
                                        .length(min: 4, message: "Name should be at least 4 characters long.")]
                
                mapper[\Person.age] = [.required(message: "Age is required"),
                                       .greater(than: 3, message: "Age should be greater than 3")]
            }
        }
        
        let personNil = Person(name: nil, age: 2)
        let nilResult = personNil.validate(excluding: [\Person.age])
        let nilMessage = nilResult.error!.firstItem?.message
        XCTAssertNotNil(nilMessage, "Expected message to not be nil, but it is.")
        XCTAssert(nilMessage! == "Name is required", "Expected message passed through argument, but got '\(nilMessage!)'")
        
        let personAna = Person(name: "Ana", age: nil)
        let anaResult = personAna.validate(excluding: [\Person.age])
        let anaMessage = anaResult.error!.firstItem?.message
        XCTAssertNotNil(anaMessage, "Expected message to not be nil, but it is.")
        XCTAssert(anaMessage! == "Name should be at least 4 characters long.", "Expected message passed through argument, but got '\(anaMessage!)'")
        
        let personJohn = Person(name: "John", age: 1)
        let johnResult = personJohn.validate(excluding: [\Person.age])
        let johnError = johnResult.error
        XCTAssertNil(johnError, "Expected error to be nil, but it isn't.")
        
        let personBob = Person(name: "Bob", age: nil)
        let bobResult = personBob.validate(excluding: [\Person.name, \Person.age])
        let bobError = bobResult.error
        XCTAssertNil(bobError, "Expected error to be nil, but it isn't.")
    }

}
