//
//  LockedState.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import Foundation

enum LockedState {
    case unknown
    case locked
    case unlocked
    
    var message: String {
        switch self {
        case .unknown:
            return ""
        case .locked:
            return "Locked"
        case .unlocked:
            return "Unlocked"
        }
    }
}
