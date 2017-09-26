//
//  Validator.swift
//  Quiver
//
//  Created by Heitor Costa on 18/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public class Validator  {
    internal private(set) var message: String?
    
    public func validate(with object: Any?) throws -> Bool {
        fatalError("Validator is an abstract class. Subclasses must override validate(with:)")
    }
    
    public final func with(message: String?) -> Validator {
        self.message = message
        return self
    }
}

public extension Validator {
    // Static default validators
    
    // Misc Validators
    public static func required(message: String? = nil) -> Validator {
        return RequiredValidator().with(message: message)
    }
    public static func not(_ validator: Validator, message: String? = nil) -> Validator {
        return NegateValidator(validator: validator).with(message: message)
    }
    
    // Comparators
    public static func equal<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: ==).with(message: message)
    }
    public static func equal<P>(to value: P, message: String? = nil) -> Validator where P: RawRepresentable, P.RawValue: Equatable {
        return ComparatorEnumValidator(value: value, operation: ==).with(message: message)
    }
    public static func different<T>(to value: T, message: String? = nil) -> Validator where T: Comparable {
        return ComparatorValidator(value: value, operation: !=).with(message: message)
    }
    public static func different<T>(to value: T, message: String? = nil) -> Validator where T: RawRepresentable, T.RawValue: Equatable {
        return ComparatorEnumValidator(value: value, operation: !=).with(message: message)
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
    
    // Ranges
    public static func between<T>(_ value1: T, and value2: T, message: String? = nil) -> Validator where T: Comparable {
        return BetweenComparator(value1: value1, value2: value2).with(message: message)
    }
    public static func from<T>(_ value1: T, to value2: T, message: String? = nil) -> Validator where T: Comparable {
        return RangeComparator(value1: value1, value2: value2).with(message: message)
    }
    
    // Strings
    public static func length(min: Int = 0, max: Int = Int.max, message: String? = nil) -> Validator {
        return LengthValidator(min: min, max: max).with(message: message)
    }
    
    public static func regex(pattern: String, message: String? = nil) -> Validator {
        return RegexValidator(pattern: pattern).with(message: message) 
    }
}
