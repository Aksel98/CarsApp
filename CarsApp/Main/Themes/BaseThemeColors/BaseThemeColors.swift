//
//  BaseThemeColors.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 09.07.22.
//

import SwiftUI

struct BaseThemeColors {
    
    func getWhite() -> Color {
        return Color(uiColor: UIColor(hexString: "#FFFFFF")!)
    }
    
    func getBlack() -> Color {
        return Color(uiColor: UIColor.black)
    }
    
    func getBlue() -> Color {
        return Color(uiColor: UIColor(hexString: "#4C72A9")!)
    }
    
    func getBrown() -> Color {
        return Color(uiColor: UIColor(hexString: "#A66A53")!)
    }
    
    func getDarkGray() -> Color {
        return Color(uiColor: UIColor(hexString: "#707070")!)
    }
    
    func getGray() -> Color {
        return Color(uiColor: UIColor(hexString: "#E5E5E5")!)
    }
    
    func getLightGray() -> Color {
        return Color(uiColor: UIColor(hexString: "#ECECEC")!)
    }
}
