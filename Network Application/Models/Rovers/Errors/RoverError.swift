//
//  RoverError.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import Foundation

enum RoverError: Error{
    case wrongUrl
    case parseError
}

extension RoverError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongUrl:
            return "Wrong URL"
        case .parseError:
            return "Perse error"
        }
    }
}
