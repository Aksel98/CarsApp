//
//  LockButtonView.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 15.07.22.
//

import SwiftUI

struct LockButtonView: View {
    
    private let buttonView: AnyView
    private var action: (() -> Void)? = nil
    private let isDisabled: Bool
    private let opacity: CGFloat
    private let foregroundColor: Color
    
    init(buttonView: AnyView, action: (() -> Void)? = nil, isDisabled: Bool = false, opacity: CGFloat = 1, foregroundColor: Color = .baseColors.black) {
        self.buttonView = buttonView
        self.action = action
        self.isDisabled = isDisabled
        self.opacity = opacity
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        Button(action: { action?() } ) { buttonView }
            .frame(maxWidth: 60, maxHeight: 60)
            .aspectRatio(1, contentMode: .fit)
            .background(RoundedRectangle(cornerRadius: 30))
            .disabled(isDisabled)
            .opacity(opacity)
            .foregroundColor(foregroundColor)
    }
}
