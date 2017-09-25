//
//  ComparatorValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

class ComparatorValidator<T>: Validator where T: Comparable {
    typealias ComparationOperator = (T,T) -> Bool
    
    private var value: T
    private var operation: ComparationOperator
    
    init(value: T, operation: @escaping ComparationOperator) {
        self.value = value
        self.operation = operation
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        if let value = object {
            print(value)
        }
        
        guard let value = object as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return operation(value, self.value)
    }
}

class ComparatorEnumValidator<T>: Validator where T: RawRepresentable, T.RawValue: Equatable {
    typealias ComparationOperator = (T,T) -> Bool
    
    private var value: T
    private var operation: ComparationOperator
    
    init(value: T, operation: @escaping ComparationOperator) {
        self.value = value
        self.operation = operation
    }
    
    override func validate(with object: Any?) throws -> Bool {
        
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return operation(value, self.value)
    }
}

