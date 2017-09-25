//
//  ValidationErrorItem.swift
//  Quiver
//
//  Created by Heitor Costa on 23/09/17.
//  Copyright © 2017 Heitor Costa. All rights reserved.
//

public struct ValidationErrorItem {
    public var message: String?
    public var type: ValidationErrorType
    public var keyPath: AnyKeyPath
}
