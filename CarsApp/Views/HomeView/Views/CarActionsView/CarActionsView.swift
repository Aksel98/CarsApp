//
//  CarActionsView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import SwiftUI

struct CarActionsView: View {
    
    @Binding private var viewModel: CarLockedInfoViewModel
    
    init(carLockingInfo: Binding<CarLockedInfoViewModel>) {
        self._viewModel = carLockingInfo
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Doors")
                            .font(.system(size: 20, weight: .bold))
                        if viewModel.lockedState != .unknown {
                            Divider()
                                .frame(width: 2, height: 20)
                                .background(Color.baseColors.darkGray)
                            Text(viewModel.lockedState.message)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color.baseColors.darkGray)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
                    HStack {
                        LockButtonView(buttonView: viewModel.getLockedImage(), action: {
                            viewModel.changeLockedDoorsPermissionAlert()
                        }, isDisabled: viewModel.getIsDisabled(), opacity: viewModel.getOpacity(), foregroundColor: viewModel.getLockedForegroundColor())
                        
                        LockButtonView(buttonView: viewModel.getUnLockedImage(), action: {
                            viewModel.changeUnlockedDoorsPermissionAlert()
                        }, isDisabled: viewModel.getIsDisabled(), opacity: viewModel.getOpacity(), foregroundColor: viewModel.getUnLockedForegroundColor())
                    }
                    .padding([.all], 15)
                    .background(Color.baseColors.white)
                }
                
                Spacer()
                CarEngineActionsView()
            }
            
            Spacer()
        }
        .padding([.leading, .trailing, .top], 25)
    }
}

struct CarActionsView_Previews: PreviewProvider {
    
    @State static var carLockingInfo = CarLockedInfoViewModel()
    
    static var previews: some View {
        CarActionsView(carLockingInfo: $carLockingInfo)
    }
}
