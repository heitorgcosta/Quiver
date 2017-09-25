//
//  ValidatorError.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public struct ValidationError {
    typealias ValidationErrorItemMap = [AnyKeyPath:[ValidationErrorItem]]
    
    public private(set) var errors: [ValidationErrorItem] = []
    private var mappedByField: ValidationErrorItemMap = [:]
    
    init(errors: [ValidationErrorItem]) {
        self.errors = errors
        
        mapErrorsByField()
    }
    
    private mutating func mapErrorsByField() {
        mappedByField = errors.reduce(ValidationErrorItemMap(), { (dict, item) -> ValidationErrorItemMap in
            var dict = dict
            
            if dict[item.keyPath] == nil {
                dict[item.keyPath] = []
            }
            
            dict[item.keyPath]?.append(item)
            
            return dict
        })
    }
    
}

