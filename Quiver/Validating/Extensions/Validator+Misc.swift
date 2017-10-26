//
//  Validator+Misc.swift
//  Quiver
//
//  Created by Heitor Costa on 20/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

// Misc Validators
public extension Validator {
    public static func required(message: String? = nil) -> Validator {
        return RequiredValidator().with(message: message)
    }
    public static func not(_ validator: Validator, message: String? = nil) -> Validator {
        return NegateValidator(validator: validator).with(message: message)
    }
    public static func when(_ condition: @escaping () -> Bool, use validator: Validator) -> Validator {
        return ConditionalValidator(conditionClosure: condition, validator: validator)
    }
}
