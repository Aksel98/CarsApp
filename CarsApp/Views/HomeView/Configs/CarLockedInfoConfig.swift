//
//  CarLockedInfoConfig.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import Foundation

struct CarLockedInfoConfig {
    var isShownLockedDoorsPermissionAlert: Bool = false
    var isShownUnlockedDoorsPermissionAlert: Bool = false
    var isDoorsLockingInProgress: Bool = false
    var isDoorsUnlockingInProgress: Bool = false
    var lockedState: LockedState = .unknown
}
