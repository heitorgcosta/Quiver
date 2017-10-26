//
//  ConditionalValidator.swift
//  Quiver
//
//  Created by Heitor Costa on 26/10/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import UIKit

class ConditionalValidator: Validator {
    
    typealias ConditionClosure = () -> Bool
    
    private var conditionClosure: ConditionClosure
    private var validator: Validator
    
    override var message: String? {
        return validator.message
    }
    
    init(conditionClosure: @escaping ConditionClosure, validator: Validator) {
        self.conditionClosure = conditionClosure
        self.validator = validator
    }
    
    override func validate(with object: Any?) throws -> Bool {
        if conditionClosure() {
            return try validator.validate(with: object)
        }
        
        return true
    }
}
