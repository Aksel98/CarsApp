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
                showDoorsActionsAlert(showingAlert: $carLockingInfo.isShownLockedDoorsPermissionAlert, message: "Please confirm, that you want to lock the doors of \(viewModel.getTitle() ?? "Swift")", doneButtonTitle: "Yes, Lock", complition: {
                    carLockingInfo.isDoorsLockingInProgress.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        carLockingInfo.isDoorsLockingInProgress.toggle()
                        carLockingInfo.lockedState = .locked
                        isShowingToast = true
                        toastViewMessage = "Doors locked"
                    })
                })
            } else if carLockingInfo.isShownUnlockedDoorsPermissionAlert {
                showDoorsActionsAlert(showingAlert: $carLockingInfo.isShownUnlockedDoorsPermissionAlert, message: "Please confirm, that you want to unlock the doors of \(viewModel.getModel() ?? "Swift")", doneButtonTitle: "Yes, Unlock", complition: {
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
    
    private func showDoorsActionsAlert(showingAlert: Binding<Bool>, title: String = "Are you sure?", message: String, doneButtonTitle: String, complition: @escaping () -> Void) -> some View {
        return AlertView(showingAlert: showingAlert, title: title, message: message, doneButtonTitle: doneButtonTitle, complition: complition)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
