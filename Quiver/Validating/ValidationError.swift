//
//  ValidatorError.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 `ValidationError` encapsulates all errors occurred during the validation proccess. The `read-only` property `items` contains all error items that was generated, each one describing the errors. Those items are what should be used to get the messages and etc.
 */
public struct ValidationError {
    
    typealias ValidationErrorItemMap = [AnyKeyPath: [ValidationErrorItem]]
    
    /// The array containing all error items occurred during validation.
    public private(set) var items: [ValidationErrorItem] = []
    /// A map containing all error items occurred during validation separated by keypaths.
    private var mappedByField: ValidationErrorItemMap = [:]
    
    /// The first item contained in the errors. Nil if there's no items.
    public var firstItem: ValidationErrorItem? {
        return items.first
    }
    
    public init(items: [ValidationErrorItem]) {
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
    
    /**
     Gets all error items occurred during validation for a specififed keypath.
     */
    public subscript(keyPath: AnyKeyPath) -> [ValidationErrorItem] {
        get {
            return mappedByField[keyPath] ?? []
        }
    }
}
