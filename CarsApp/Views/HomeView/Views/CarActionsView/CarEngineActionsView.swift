//
//  CarEngineActionsView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 15.07.22.
//

import SwiftUI

struct CarEngineActionsView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Engine")
                    .font(.system(size: 20, weight: .bold))
            }
            
            HStack {
                LockButtonView(buttonView: AnyView(
                    Text("Start")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.baseColors.white)))
                LockButtonView(buttonView: AnyView(
                    Text("Stop")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.baseColors.white)
                ))
            }
            .padding([.all], 15)
            .background(Color.white)
        }
    }
}
