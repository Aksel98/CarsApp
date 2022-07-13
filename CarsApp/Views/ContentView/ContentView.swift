//
//  ContentView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 08.07.22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.primary)
        UITabBar.appearance().barTintColor = .red
    }
    
    var body: some View {
        TabView {
            ZStack {
                HomeView()
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
        .accentColor(.baseColors.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
