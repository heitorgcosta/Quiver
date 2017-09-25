//
//  ValidatorError.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public struct ValidationError {
    typealias ValidationErrorItemMap = [AnyKeyPath:[ValidationErrorItem]]
    
    public private(set) var items: [ValidationErrorItem] = []
    private var mappedByField: ValidationErrorItemMap = [:]
    
    public var firstItem: ValidationErrorItem? {
        return items.first
    }
    
    init(items: [ValidationErrorItem]) {
        self.items = items
        
        mapItemsByField()
    }
    
    private mutating func mapItemsByField() {
        mappedByField = items.reduce(ValidationErrorItemMap(), { (dict, item) -> ValidationErrorItemMap in
            var dict = dict
            
            if dict[item.keyPath] == nil {
                dict[item.keyPath] = []
            }
            
            dict[item.keyPath]?.append(item)
            
            return dict
        })
    }
    
}

