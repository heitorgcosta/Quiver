//
//  Searchable.swift
//  Quiver
//
//  Created by Heitor Costa on 25/08/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 A protocol that defines objects that can be searched through an array. Objects conforming to this protocol must implement a function to return all searchable values.
 */
public protocol Searchable {
    /**
     Returns an array of the values available to be searched. The values could be any number, string, character or other objects conforming to the Searchable protocol.
     
     - Returns: An array of the values to be searched.
     */
    func searchableFields() -> [Any?]
}
