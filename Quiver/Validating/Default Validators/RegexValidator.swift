//
//  RegexValidator.swift
//  Quiver
//
//  Created by Luciano Almeida on 26/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

class RegexValidator: Validator {
    
    var pattern: String
    
    init(pattern: String) {
        self.pattern = pattern
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if object == nil {
            return true
        }
        
        guard let string = object as? String else {
            throw ValidationErrorType.typeMismatch(expected: String.self, actual: type(of: object!))
        }
        
        // RequiredValidator takes care of this validation.
        if string.isEmpty {
            return true
        }
        return string.range(of: pattern, options: String.CompareOptions.regularExpression, range: nil, locale: nil) != nil
    }
}
