//
//  ValidatorResult.swift
//  Quiver
//
//  Created by Heitor Costa on 19/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

/**
 The `ValidatorResult` class describes the result of an object's validation. Its boolean `success` tells if the validation was successful or not, and the `error` property encapsulates all errors occurred during the validation proccess.
 */
public struct ValidatorResult {
    
    /// A boolean indicating if the validation was successful or not.
    public private(set) var success: Bool
    /// An object encapsulating all the errors occurred during validation. Nil if none occurred.
    public private(set) var error: ValidationError?
    
    init(success: Bool, error: ValidationError?) {
        self.success = success
        self.error = error
    }
}
