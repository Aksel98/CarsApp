//
//  HomeView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 09.07.22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = CarInfoViewModel()
    @State private var carLockingInfo: CarLockedInfoViewModel = CarLockedInfoViewModel()
    @State private var isShowingToast = false
    @State private var toastViewMessage: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView().frame(height: 50)
                
                VStack {
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: Color.baseColors.lightGray, location: 0.2),
                        Gradient.Stop(color: Color.baseColors.gray, location: 0.2),
                    ]), startPoint: .top, endPoint: .bottom)
                    .overlay(
                        VStack {
                            CarInfoView()
                            CarActionsView(carLockingInfo: $carLockingInfo)
                            Spacer()
                        }
                    )
                }
                .padding(.top, 20)
            }
            .background(Color.baseColors.lightGray)
            .environmentObject(viewModel)
            
            ToastView(isShowing: $isShowingToast, duration: 5, message: toastViewMessage).offset(x: 0, y: 50)
                    
            if carLockingInfo.isShownLockedDoorsPermissionAlert {
                AlertView(showingAlert: $carLockingInfo.isShownLockedDoorsPermissionAlert, title: "Are you sure?", message: "Please confirm, that you want to lock the doors of \(viewModel.getTitle() ?? "Swift")", doneButtonTitle: "Yes, Lock", complition: {
                    carLockingInfo.isDoorsLockingInProgress.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        carLockingInfo.isDoorsLockingInProgress.toggle()
                        carLockingInfo.lockedState = .locked
                        isShowingToast = true
                        toastViewMessage = "Doors locked"
                    })
                })
            } else if carLockingInfo.isShownUnlockedDoorsPermissionAlert {
                AlertView(showingAlert: $carLockingInfo.isShownUnlockedDoorsPermissionAlert, title: "Are you sure?", message: "Please confirm, that you want to unlock the doors of \(viewModel.getModel() ?? "Swift")", doneButtonTitle: "Yes, Unlock", complition: {
                    carLockingInfo.isDoorsUnlockingInProgress.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        carLockingInfo.isDoorsUnlockingInProgress.toggle()
                        carLockingInfo.lockedState = .unlocked
                        isShowingToast = true
                        toastViewMessage = "Doors unlocked"
                    })
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
