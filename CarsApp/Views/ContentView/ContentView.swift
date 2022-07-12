//
//  ContentView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 08.07.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ZStack {
                HomeView()
                VStack {
                    Spacer()
                    Color.baseColors.getWhite().frame(height: 100)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Text("Coming soon").bold()
                .tabItem {
                    Image(systemName: "car")
                    Text("Vehicle")
                }
            Text("Coming soon").bold()
                .tabItem {
                    Image(systemName: "location")
                    Text("Location")
                }
            Text("Coming soon").bold()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.baseColors.getBrown())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
