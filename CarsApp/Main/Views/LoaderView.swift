//
//  LoaderView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var isAnimating: Bool = false
    
    private var speed: Double
    private var size: CGFloat
    
    init(speed: Double = 1, size: CGFloat = 60) {
        self.speed = speed
        self.size = size
    }

    var body: some View {
        Circle()
            .trim(from: isAnimating ? 0.5 : 0.4, to: 1.4)
            .stroke(Color.baseColors.brown, style: StrokeStyle(lineWidth: size / 30, lineCap: .round, lineJoin: .round))
            .animation(.easeInOut(duration: speed / 2).repeatForever(), value: isAnimating)
            .rotationEffect(
                Angle(degrees: isAnimating ? 360 : 0)
            )
            .animation(.linear(duration: speed).repeatForever(autoreverses: false), value: isAnimating)
            .frame(width: size, height: size, alignment: .center)
            .onAppear {
                isAnimating.toggle()
            }
    }
}
