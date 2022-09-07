//
//  ApiError.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation
enum ApiError: Equatable, Error {
    case dataError
    case nonHTTPResponse
    case serializationError
    case internetError
    case requestFailed(error: String?)
    case emptylist
    case clientError
    case serverError
    case undefined
}
