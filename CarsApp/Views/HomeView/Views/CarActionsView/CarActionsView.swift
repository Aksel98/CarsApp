//
//  CarActionsView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import SwiftUI

struct CarActionsView: View {
    
    @Binding private var carLockingInfo: CarLockedInfoConfig
    
    private var lockedColor: Color {
        return carLockingInfo.lockedState == .locked ? .baseColors.brown : .black
    }
    
    private var unLockedColor: Color {
        return carLockingInfo.lockedState == .unlocked ? .baseColors.brown : .black
    }
    
    init(carLockingInfo: Binding<CarLockedInfoConfig>) {
        self._carLockingInfo = carLockingInfo
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Doors")
                            .font(.system(size: 20, weight: .bold))
                        if carLockingInfo.lockedState != .unknown {
                            Divider()
                                .frame(width: 2, height: 20)
                                .background(Color.baseColors.darkGray)
                            Text(carLockingInfo.lockedState.message)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color.baseColors.darkGray)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
                    HStack {
                        getActionView(buttonView: carLockingInfo.isDoorsLockingInProgress ? AnyView(LoaderView()) : AnyView(Image("act_lock")), action: {
                            carLockingInfo.isShownLockedDoorsPermissionAlert.toggle()
                        })
                        .disabled(carLockingInfo.isDoorsLockingInProgress || carLockingInfo.isDoorsUnlockingInProgress)
                        .opacity((carLockingInfo.isDoorsLockingInProgress || carLockingInfo.isDoorsUnlockingInProgress) ? 0.5 : 1)
                        .foregroundColor(carLockingInfo.isDoorsLockingInProgress ? .white : lockedColor)
                        
                        getActionView(buttonView: carLockingInfo.isDoorsUnlockingInProgress ? AnyView(LoaderView()) : AnyView(Image("act_unlock")), action: {
                            carLockingInfo.isShownUnlockedDoorsPermissionAlert.toggle()
                        })
                        .disabled(carLockingInfo.isDoorsLockingInProgress || carLockingInfo.isDoorsUnlockingInProgress)
                        .opacity((carLockingInfo.isDoorsLockingInProgress || carLockingInfo.isDoorsUnlockingInProgress) ? 0.5 : 1)
                        .foregroundColor(carLockingInfo.isDoorsUnlockingInProgress ? .white : unLockedColor)
                    }
                    .padding([.all], 15)
                    .background(Color.white)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Engine")
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                    HStack {
                        getActionView(buttonView: AnyView(
                            Text("Start")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)))
                        getActionView(buttonView: AnyView(
                            Text("Stop")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                        ))
                    }
                    .padding([.all], 15)
                    .background(Color.white)
                }
            }
            Spacer()
        }
        .padding([.leading, .trailing, .top], 25)
    }
    
    private func getActionView(buttonView: AnyView, action: (() -> Void)? = nil) -> some View {
        return Button(action: { action?() } ) { buttonView }
            .frame(maxWidth: 60, maxHeight: 60)
            .aspectRatio(1, contentMode: .fit)
            .background(RoundedRectangle(cornerRadius: 30))
    }
}

struct CarActionsView_Previews: PreviewProvider {
    
    @State static var carLockingInfo = CarLockedInfoConfig()
    
    static var previews: some View {
        CarActionsView(carLockingInfo: $carLockingInfo)
    }
}
