//
//  RangeValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

class BetweenComparator<T>: Validator where T: Comparable {
    
    private var value1: T
    private var value2: T
    
    init(value1: T, value2: T) {
        self.value1 = value1
        self.value2 = value2
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return value > self.value1 && value < self.value2
    }
}

class RangeComparator<T>: Validator where T: Comparable {
    
    private var value1: T
    private var value2: T
    
    init(value1: T, value2: T) {
        self.value1 = value1
        self.value2 = value2
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return value >= self.value1 && value <= self.value2
    }
}

class RangeTypeValidator<T>: Validator where T: Comparable {
    var range: Range<T>
    
    init(range: Range<T>) {
        self.range = range
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return range~=value
    }
}

class ClosedRangeTypeValidator<T>: Validator where T: Comparable {
    var range: ClosedRange<T>

    init(range: ClosedRange<T>) {
        self.range = range
    }

    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }

        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }

        return range~=value
    }
}

class PartialRangeFromTypeValidator<T>: Validator where T: Comparable {
    var range: PartialRangeFrom<T>

    init(range: PartialRangeFrom<T>) {
        self.range = range
    }

    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }

        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }

        return range~=value
    }
}

class PartialRangeUpToTypeValidator<T>: Validator where T: Comparable {
    var range: PartialRangeUpTo<T>
    
    init(range: PartialRangeUpTo<T>) {
        self.range = range
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return range~=value
    }
}

class PartialRangeThroughTypeValidator<T>: Validator where T: Comparable {
    var range: PartialRangeThrough<T>
    
    init(range: PartialRangeThrough<T>) {
        self.range = range
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let value = object! as? T else {
            throw ValidationErrorType.typeMismatch(expected: T.self, actual: type(of: object!))
        }
        
        return range~=value
    }
}

