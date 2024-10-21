//
//  Error.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import Foundation

enum CustomError: LocalizedError {
    case badRequest(String)
    case unauthorized(String)
    case forbidden(String)
    case notFound(String)
    case internalServerError(String)
    
    var errorDescription: String? {
        switch self {
        case .badRequest(let message),
             .unauthorized(let message),
             .forbidden(let message),
             .notFound(let message),
             .internalServerError(let message):
            return message
        }
    }
}
