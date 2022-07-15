//
//  CarLockedInfoViewModel.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import SwiftUI

struct CarLockedInfoViewModel {
    
    var isShownLockedDoorsPermissionAlert: Bool = false
    var isShownUnlockedDoorsPermissionAlert: Bool = false
    var isDoorsLockingInProgress: Bool = false
    var isDoorsUnlockingInProgress: Bool = false
    var lockedState: LockedState = .unknown
    
    func getLockedColor() -> Color {
        return lockedState == .locked ? .baseColors.brown : .black
    }
    
    func getUnLockedColor() -> Color {
        return lockedState == .unlocked ? .baseColors.brown : .black
    }
    
    func getLockedImage() -> AnyView {
        return isDoorsLockingInProgress ? AnyView(LoaderView()) : AnyView(Image("act_lock"))
    }
    
    func getUnLockedImage() -> AnyView {
        return isDoorsUnlockingInProgress ? AnyView(LoaderView()) : AnyView(Image("act_unlock"))
    }
    
    func getIsDisabled() -> Bool {
        return isDoorsLockingInProgress || isDoorsUnlockingInProgress
    }
    
    func getOpacity() -> CGFloat {
        return getIsDisabled() ? 0.5 : 1
    }
    
    func getLockedForegroundColor() -> Color {
        return isDoorsLockingInProgress ? .white : getLockedColor()
    }

    func getUnLockedForegroundColor() -> Color {
        return isDoorsUnlockingInProgress ? .white : getUnLockedColor()
    }
    
    mutating func changeLockedDoorsPermissionAlert() {
        isShownLockedDoorsPermissionAlert.toggle()
    }
    
    mutating func changeUnlockedDoorsPermissionAlert() {
        isShownUnlockedDoorsPermissionAlert.toggle()
    }
}
