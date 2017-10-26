//
//  CustomValidator.swift
//  Quiver
//
//  Created by Luciano Almeida on 27/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

import Foundation

class CustomValidator: Validator {
    
    typealias ValidationClousure = (Any?) -> Bool
    
    private var closure: ValidationClousure
    
    init(closure: @escaping ValidationClousure) {
        self.closure = closure
    }
    
    override func validate(with object: Any?) throws -> Bool {
        return closure(object)
    }
}
