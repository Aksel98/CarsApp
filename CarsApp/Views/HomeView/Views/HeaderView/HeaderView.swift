//
//  HeaderView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 09.07.22.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var viewModel: CarInfoViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(viewModel.car?.title ?? "Swift")
                    .lineLimit(2)
                .font(.system(size: 25))
                Divider().frame(width: 2, height: 30)
                    .background(Color.baseColors.getBrown())
              
                HStack {
                    Image("notif_gas")
                    Text(viewModel.car?.model ?? "v5").fontWeight(.bold)
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 5)
            .padding(.bottom, 15)
            .background(Color.baseColors.getWhite())
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
