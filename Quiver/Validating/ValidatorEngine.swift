//
//  ValidatorEngine.swift
//  Quiver
//
//  Created by Heitor Costa on 22/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

internal protocol IsOptional {}
extension Optional: IsOptional {}

class ValidatorEngine<T> where T: Validatable {
    private(set) var mapper: ValidatorMapper
    private(set) var validatableSubject: T
    
    init(mapper: ValidatorMapper, validatableSubject: T) {
        self.mapper = mapper
        self.validatableSubject = validatableSubject
    }
    
    func performValidations() -> ValidatorResult {
        validatableSubject.validations(with: mapper)
        
        let keyPaths = mapper.keyPaths
        var errorItems: [ValidationErrorItem] = []
        for keyPath in keyPaths {
            let validators = mapper[keyPath]
            let unit = ValidatorEngineUnit(object: validatableSubject, keyPath: keyPath, validators: validators)
            errorItems.append(contentsOf: unit.results())
        }
        
        return ValidatorResult(success: errorItems.count == 0, error: errorItems.count == 0 ? nil : ValidationError(items: errorItems))
    }
}

class ValidatorEngineUnit {
    private(set) var object: Any
    private(set) var keyPath: AnyKeyPath
    private(set) var validators: [Validator]
    
    init(object: Any, keyPath: AnyKeyPath, validators: [Validator]) {
        self.object = object
        self.keyPath = keyPath
        self.validators = validators
    }
    
    func results() -> [ValidationErrorItem] {
        var errorItems: [ValidationErrorItem] = []
        
        for validator in validators {
            let unwrappedValue = object[keyPath: keyPath]!
            
            var value: Any? = nil
            if unwrappedValue is IsOptional {
                if let (_, a) = Mirror(reflecting: unwrappedValue).children.first {
                    value = a as Any
                }
            } else {
                value = unwrappedValue as Any
            }
            
            do {
                let result = try validator.validate(with: value)
                if !result {
                    errorItems.append(ValidationErrorItem(message: validator.message,
                                                          type: .validation(value: value),
                                                          keyPath: keyPath))
                }
            } catch let error as ValidationErrorType {
                errorItems.append(ValidationErrorItem(message: validator.message,
                                                      type: error,
                                                      keyPath: keyPath))
            } catch let error {
                fatalError("Unknown error occurred during validation: \(error.localizedDescription). Check if any validators are throwning errors other than ValidationErrorType.")
            }
            
        }
        
        return errorItems
    }
}
