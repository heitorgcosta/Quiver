//
//  ValidationErrorItem.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public struct ValidationErrorItem {
    var message: String?
    var type: ValidationErrorType
    var keyPath: AnyKeyPath
}
