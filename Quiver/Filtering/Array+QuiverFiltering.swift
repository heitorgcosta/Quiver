//
//  Array+QuiverFiltering.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public extension Array where Element: Any {
    
    public func filter(by keyPath: PartialKeyPath<Element>, with validators: [Validator]) -> [Element] {
        
        return self.flatMap({ element in
            let unit = ValidatorEngineUnit(object: element, keyPath: keyPath, validators: validators)
            return unit.results().count == 0 ? element : nil
        })
    }
}
