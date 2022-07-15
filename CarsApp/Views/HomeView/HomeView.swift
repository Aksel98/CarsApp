//
//  HomeView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 09.07.22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var carInfoViewModel = CarInfoViewModel()
    @State private var carLockedInfoViewModel = CarLockedInfoViewModel()
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
                            CarActionsView(carLockingInfo: $carLockedInfoViewModel)
                            Spacer()
                        }
                    )
                }
                .padding(.top, 20)
            }
            .background(Color.baseColors.lightGray)
            .environmentObject(carInfoViewModel)
            
            ToastView(isShowing: $isShowingToast, duration: 5, message: toastViewMessage).offset(x: 0, y: 50)
                    
            if carLockedInfoViewModel.isShownLockedDoorsPermissionAlert {
                AlertView(showingAlert: $carLockedInfoViewModel.isShownLockedDoorsPermissionAlert, title: "Are you sure?", message: "Please confirm, that you want to lock the doors of \(carInfoViewModel.getTitle() ?? "Swift")", doneButtonTitle: "Yes, Lock", complition: {
                    carLockedInfoViewModel.isDoorsLockingInProgress.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        carLockedInfoViewModel.isDoorsLockingInProgress.toggle()
                        carLockedInfoViewModel.lockedState = .locked
                        isShowingToast = true
                        toastViewMessage = "Doors locked"
                    })
                })
            } else if carLockedInfoViewModel.isShownUnlockedDoorsPermissionAlert {
                AlertView(showingAlert: $carLockedInfoViewModel.isShownUnlockedDoorsPermissionAlert, title: "Are you sure?", message: "Please confirm, that you want to unlock the doors of \(carInfoViewModel.getModel() ?? "Swift")", doneButtonTitle: "Yes, Unlock", complition: {
                    carLockedInfoViewModel.isDoorsUnlockingInProgress.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                        carLockedInfoViewModel.isDoorsUnlockingInProgress.toggle()
                        carLockedInfoViewModel.lockedState = .unlocked
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
