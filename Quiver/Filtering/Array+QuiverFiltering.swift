//
//  Array+QuiverFiltering.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public extension Array where Element: Any {
    
    /**
     Filters the array for objects that the value of a specified keypath passes the specified validations.
     
     - parameters:
     - keyPath: The keypath to be used for filtering.
     - validators: An array of validators that defines the rules of the filter..
     
     - Returns: An array with the elements that the value of the keypath passing the validations.
     */
    public func filter(by keyPath: PartialKeyPath<Element>, with validators: [Validator]) -> [Element] {
        
        return self.compactMap({ element in
            let unit = ValidatorEngineUnit(object: element, keyPath: keyPath, validators: validators)
            return unit.results().count == 0 ? element : nil
        })
    }
}
