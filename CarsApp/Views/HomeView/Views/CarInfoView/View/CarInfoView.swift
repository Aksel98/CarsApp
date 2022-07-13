//
//  CarInfoView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import SwiftUI

struct CarInfoView: View {
    
    @EnvironmentObject var viewModel: CarInfoViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        viewModel.getCars()
                    }) {
                        Image("btn_refresh")
                    }
                    
                    Text("Refresh button")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.baseColors.darkGray)
                }
                
                if let carImageName = viewModel.car?.image, let url = URL(string: carImageName), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 250, height: 200)
                } else {
                    Image("car_default_image")
                        .resizable()
                        .frame(width: 250, height: 200)
                }
            }
        }
    }
}

struct CarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CarInfoView()
    }
}
