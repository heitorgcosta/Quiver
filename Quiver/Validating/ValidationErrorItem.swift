//
//  ValidationErrorItem.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 `ValidationErrorItem` describes one error occurred during validation.
 */
public struct ValidationErrorItem {
    
    /// The message of the occurred error.
    public var message: String?
    /// The type of error occurred.
    public var type: ValidationErrorType
    /// The keypath that caused the error.
    public var keyPath: AnyKeyPath
}
