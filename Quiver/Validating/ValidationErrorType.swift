//
//  ValidationErrorType.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 `ValidationErrorType` defines the errors that can be caused during validations.
 */
public enum ValidationErrorType: Error {
    
    /// Happens when the type of the validating object and the expected type difers.
    case validation(value: Any?)
    /// Happens when the validation fails normally, when the value passeddoes not match the expected value.
    case typeMismatch(expected: Any.Type, actual: Any.Type)
}
