//
//  LengthValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public class LengthValidator: Validator {
    private var min: Int
    private var max: Int
    
    init(min: Int = 0, max: Int = Int.max) {
        self.min = min
        self.max = max
    }
    
    override public func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let string = object as? String else {
            throw ValidationErrorType.typeMismatch(expected: String.self, actual: type(of: object!))
        }
        
        return (min...max).contains(string.count)
    }
}
