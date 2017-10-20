//
//  Validator+Range.swift
//  Quiver
//
//  Created by Heitor Costa on 20/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

// Ranges
extension Validator {
    public static func between<T>(_ value1: T, and value2: T, message: String? = nil) -> Validator where T: Comparable {
        return BetweenComparator(value1: value1, value2: value2).with(message: message)
    }
    
    public static func from<T>(_ value1: T, to value2: T, message: String? = nil) -> Validator where T: Comparable {
        return RangeComparator(value1: value1, value2: value2).with(message: message)
    }
}
