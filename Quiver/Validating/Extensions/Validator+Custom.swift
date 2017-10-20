//
//  Validator+Custom.swift
//  Quiver
//
//  Created by Heitor Costa on 20/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

// Custom
extension Validator {
    public static func custom(message: String? = nil, validador: @escaping (Any?) -> Bool) -> Validator {
        return CustomValidator(closure: validador).with(message: message)
    }
}
