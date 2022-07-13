//
//  AlertView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import SwiftUI

struct AlertView: View {
    
    @Binding private var showingAlert: Bool
    
    private var alertWidth: Double
    private var alertHeight: Double
    private var title: String
    private var message: String
    private var doneButtonTitle: String
    private var complition: (() -> Void)?
    
    init(showingAlert: Binding<Bool>, title: String, message: String, doneButtonTitle: String, alertWidth: Double? = nil, alertHeight: Double = 200, complition: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.doneButtonTitle = doneButtonTitle
        self.alertWidth = alertWidth ?? (UIScreen.main.bounds.width - 50)
        self.alertHeight = alertHeight
        self.complition = complition
        
        self._showingAlert = showingAlert
    }
    
    var body: some View {
        if showingAlert {
            ZStack {
                Color.baseColors.black
                .opacity(0.7)

                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title).frame(alignment: .leading)
                            .font(.system(size: 20, weight: .bold))
                        Text(message)
                            .font(.system(size: 15))
                        Spacer()
                    }
                    .padding(.leading, 25)
                    .padding(.top, 20)
                    .frame(width: alertWidth, alignment: .leading)

                    HStack(spacing: 20) {
                        Button("Cancel") {
                            showingAlert.toggle()
                        }
                        .frame(minWidth: 80)
                        .padding(10)
                        .foregroundColor(Color.baseColors.blue)
                        .font(.system(size: 15, weight: .bold))

                        Button(doneButtonTitle) {
                            complition?()
                            showingAlert.toggle()
                        }
                        .frame(minWidth: 80)
                        .padding(10)
                        .background(Color.baseColors.blue)
                        .foregroundColor(.baseColors.white)
                        .font(.system(size: 15, weight: .bold))
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .frame(width: alertWidth - 20, height: 50, alignment: .trailing)
                }
                .frame(width: alertWidth, height: alertHeight)
                .background(Color.baseColors.white)
                .cornerRadius(10)
            }
            .ignoresSafeArea()
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    
    @State static var isShowingToast = false

    static var previews: some View {
        AlertView(showingAlert: $isShowingToast, title: "Hello", message: "...", doneButtonTitle: "Yes")
            .previewInterfaceOrientation(.portrait)
    }
}
