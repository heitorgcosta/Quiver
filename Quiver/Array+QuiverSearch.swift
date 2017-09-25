//
//  Array+QuiverSearch.swift
//  Quiver
//
//  Created by Heitor Costa on 25/08/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public extension Array where Element: Searchable {
    
    /**
     Search the array for Searchable objects with matching fields marked as a searchable field.
    
     - parameters:
         - text: The text to be compared with the searchable fields.
         - caseSensitive: A boolean defining if the search is case sensitive or not. It is false by default.
     
     - Returns: An array with the elements with matching fields.
    */
 
    public func search(withText text: String, caseSensitive: Bool = false) -> [Element] {
        var results: [Element] = []
        
        for element in self {
            let components = flattenedProperties(element, caseSensitive)
            
            for component in components {
                if component.contains(caseSensitive ? text : text.lowercased()) {
                    results.append(element)
                    break
                }
            }
        }
        
        return results
    }
    
    private func flattenedProperties(_ element: Searchable, _ caseSensitive: Bool) -> [String] {
        var flatProperties: [String] = []
        
        let properties = element.searchableFields()
        
        for property in properties {
            
            if property == nil {
                continue
            }
            
            if let prop = property as? String {
                flatProperties.append(caseSensitive ? prop : prop.lowercased())
                continue
            }
            
            if let prop = property as? Stringable {
                let stringProperty = prop.convertToString()
                
                flatProperties.append(caseSensitive ? stringProperty : stringProperty.lowercased())
                continue
            }
            
            if let prop = property as? Searchable {
                let subProperties = self.flattenedProperties(prop, caseSensitive)
                flatProperties.append(contentsOf: subProperties)
                continue
            }
            
            fatalError("Property of type \(type(of: property)) doesn't conform to Searchable protocol.")
        }
        
        return flatProperties
    }
    
}
