//
//  ToastView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var isShowing: Bool
    
    let duration: TimeInterval
    let message: String
    
    var body: some View {
        ZStack {
            if isShowing {
                VStack {
                    Spacer()
                    HStack {
                        Text(message)
                            .foregroundColor(.baseColors.getWhite())
                            .font(.system(size: 15, weight: .bold))
                        Spacer()
                        Image("approve_icon")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 20)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.baseColors.getBlack())
                    .cornerRadius(5)
                    .shadow(radius: 5)
                }
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 50)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
                        isShowing = false
                    })
                }
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    
    @State static var isShowingToast = false

    static var previews: some View {
        ToastView(isShowing: $isShowingToast, duration: 3, message: "")
            .previewInterfaceOrientation(.portrait)
    }
}
