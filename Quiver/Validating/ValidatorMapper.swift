//
//  Validator.swift
//  Quiver
//
//  Created by Heitor Costa on 16/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 A type used for mapping validators to keypaths.
 */
public class ValidatorMapper {
    private typealias Map = [AnyKeyPath:[Validator]]
    
    private var mapping: Map = Map()
    private var excludedKeyPaths: [AnyKeyPath] = []
    
    public private(set) var keyPaths: [AnyKeyPath] = []
    
    init(excluding keyPaths: [AnyKeyPath]) {
        self.excludedKeyPaths = keyPaths
    }
    
    public subscript(keyPath: AnyKeyPath) -> [Validator] {
        get {
            return mapping[keyPath]!
        }
        set {
            if excludedKeyPaths.contains(keyPath) {
                return
            }
            
            mapping[keyPath] = newValue
            if !keyPaths.contains(keyPath) {
                keyPaths.append(keyPath)
            }
        }
    }
}
