//
//  Validator.swift
//  Quiver
//
//  Created by Heitor Costa on 18/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 A `Validator` describes the validation process of data. It should be treated as an abstract class, meaning that any new type of validation should be a subclass of `Validator`. For example, the validator that checks if a string matches a regex is the `RegexValidator` class, which inherits from `Validator`.
 
 Subclasses of `Validator` should implement the `validate(with:)` function, which receives an object of type `Any?`. In most cases, you'll want to ignore (`return true`) if the object is `nil`, since the `RequiredValdiator` will in most cases be the validator that takes care of the `nil` validation.
 
 Also, the `validate(with:)` function should check type compatibility, if it validates an specific type of data, and throw `ValidationErrorType.typeMismatch` if necessary.
 */
open class Validator {
    
    /// The error message that will be presented in the validation errors.
    public private(set) var message: String?
    
    /**
     Performs validation on the specified object as context.
     
     - Returns: A boolean telling if the validation is true or false.
     
     - Throws: An error of type `ValidationErrorType`. Most cases, it should be a `ValidationErrorType.typeMismatch`.
     
     - Parameters:
         - object: The object to be validated.
     
     - Important: If the implementation of the root class `Validator` is called, it will result in a fatal error.
     */
    public func validate(with object: Any?) throws -> Bool {
        fatalError("Validator is an abstract class. Subclasses must override validate(with:)")
    }
    
    /**
     Applies the error message to this instance of validator.
     
     - Returns: Self a message set.
     
     - Parameters:
         - message: The message to be presented at validation error.
     */
    public final func with(message: String?) -> Validator {
        self.message = message
        return self
    }
}

// Static default validators
