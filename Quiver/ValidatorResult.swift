//
//  ValidatorResult.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public struct ValidatorResult {
    public private(set) var success: Bool
    public private(set) var error: ValidationError?
    
    init(success: Bool, error: ValidationError?) {
        self.success = success
        self.error = error
    }
}
