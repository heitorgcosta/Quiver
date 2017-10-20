//
//  Validator+Comparators.swift
//  Quiver
//
//  Created by Heitor Costa on 20/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

// Comparators
extension Validator {
    public static func equal<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: ==).with(message: message)
    }
    
    public static func different<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: !=).with(message: message)
    }
    
    public static func greater<T>(than value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: >).with(message: message)
    }
    
    public static func less<T>(than value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: <).with(message: message)
    }
    
    public static func greaterOrEqual<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: >=).with(message: message)
    }
    
    public static func lessOrEqual<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: <=).with(message: message)
    }
}
