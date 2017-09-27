//
//  NegateValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

class NegateValidator: Validator {
    private var validator: Validator
    
    init(validator: Validator) {
        self.validator = validator
    }
    
    override func validate(with object: Any?) throws -> Bool {
        return try !validator.validate(with: object)
    }
}
