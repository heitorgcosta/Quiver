//
//  RequiredValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 18/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

class RequiredValidator: Validator {
    override func validate(with object: Any?) throws -> Bool {
        if let str = object as? String {
            return !str.isEmpty
        }
        
        return object != nil
    }
}
