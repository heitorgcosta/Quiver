//
//  ValidationErrorType.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

enum ValidationErrorType: Error {
    case validation(value: Any?)
    case typeMismatch(expected: Any.Type, actual: Any.Type)
}
