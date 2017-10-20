//
//  Validator+EnumComparators.swift
//  Quiver
//
//  Created by Heitor Costa on 20/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

extension Validator {
    public static func equal<P>(to value: P, message: String? = nil) -> Validator where P: RawRepresentable, P.RawValue: Equatable {
        return ComparatorEnumValidator(value: value, operation: ==).with(message: message)
    }
    
    public static func different<T>(to value: T, message: String? = nil) -> Validator where T: RawRepresentable, T.RawValue: Equatable {
        return ComparatorEnumValidator(value: value, operation: !=).with(message: message)
    }
}
