//
//  FruitType.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import UIKit
import SwiftUI
import SpriteKit

enum FruitType: CaseIterable {
    case level1 //cherry
    case level2 //blueberry
    case level3 //lime
    case level4 //orange
    case level5 //apple
    case level6 //pear
    case level7 //passion
    case level8 //coconut
    case level9 //melon
    case level10 //pineapple
    case level11 //watermelon
    
    var textureName: String {
        switch self {
        case .level1:
            return "dtf_cherry"
        case .level2:
            return "dtf_blueberry"
        case .level3:
            return "dtf_lime"
        case .level4:
            return "dtf_orange"
        case .level5:
            return "dtf_apple"
        case .level6:
            return "dtf_pear"
        case .level7:
            return "dtf_passion"
        case .level8:
            return "dtf_coco"
        case .level9:
            return "dtf_melon"
        case .level10:
            return "dtf_pineapple"
        case .level11:
            return "dtf_wm"
        }
    }
    
    var color: UIColor {
        switch self {
        case .level1:
            return .init(hex: "B20603")
        case .level2:
            return .init(hex: "1672C4")
        case .level3:
            return .init(hex: "42B940")
        case .level4:
            return .init(hex: "F9CEB2")
        case .level5:
            return .init(hex: "E4241F")
        case .level6:
            return .init(hex: "FFCE71")
        case .level7:
            return .init(hex: "FFAAB6")
        case .level8:
            return .init(hex: "D3784A")
        case .level9:
            return .init(hex: "CED84C")
        case .level10:
            return .init(hex: "F0B813")
        case .level11:
            return .init(hex: "00C527")
        }
    }
    var evolutionScale: CGFloat {
        switch self {
        case .level1:
            return 0.50
        case .level2:
            return 0.50
        case .level3:
            return 0.35
        case .level4:
            return 0.35
        case .level5:
            return 0.35
        case .level6:
            return 0.31
        case .level7:
            return 0.30
        case .level8:
            return 0.26
        case .level9:
            return 0.27
        case .level10:
            return 0.25
        case .level11:
            return 0.25
        }
    }
    var mass: CGFloat {
        switch self {
        case .level1:
            return 12
        case .level2:
            return 15
        case .level3:
            return 18
        case .level4:
            return 23
        case .level5:
            return 30
        case .level6:
            return 30
        case .level7:
            return 35
        case .level8:
            return 40
        case .level9:
            return 50
        case .level10:
            return 55
        case .level11:
            return 60
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .level1:
            return 10
        case .level2:
            return 20
        case .level3:
            return 30
        case .level4:
            return 40
        case .level5:
            return 50
        case .level6:
            return 60
        case .level7:
            return 70
        case .level8:
            return 80
        case .level9:
            return 90
        case .level10:
            return 100
        case .level11:
            return 110
        }
    }

    var particleSize: CGFloat {
        switch self {
        case .level1:
            return 7
        case .level2:
            return 8
        case .level3:
            return 9
        case .level4:
            return 10
        case .level5:
            return 11
        case .level6:
            return 12
        case .level7:
            return 14
        case .level8:
            return 15
        case .level9:
            return 16
        case .level10:
            return 17
        case .level11:
            return 18
        }
    }
    
    var birthrate: CGFloat {
        switch self {
        case .level1:
            return 30
        case .level2:
            return 120
        case .level3:
            return 300
        case .level4:
            return 330
        case .level5:
            return 380
        case .level6:
            return 410
        case .level7:
            return 450
        case .level8:
            return 500
        case .level9:
            return 800
        case .level10:
            return 1000
        case .level11:
            return 1200
        }
    }
    var numParticle: Int {
        switch self {
        case .level1:
            return 5
        case .level2:
            return 30
        case .level3:
            return 50
        case .level4:
            return 60
        case .level5:
            return 80
        case .level6:
            return 100
        case .level7:
            return 150
        case .level8:
            return 170
        case .level9:
            return 220
        case .level10:
            return 280
        case .level11:
            return 300
        }
    }
    var score: Int {
        switch self {
        case .level1:
            return 1
        case .level2:
            return 3
        case .level3:
            return 6
        case .level4:
            return 10
        case .level5:
            return 15
        case .level6:
            return 21
        case .level7:
            return 28
        case .level8:
            return 36
        case .level9:
            return 45
        case .level10:
            return 55
        case .level11:
            return 66
        }
    }

    var next: FruitType {
        switch self {
        case .level1:
            return .level2
        case .level2:
            return .level3
        case .level3:
            return .level4
        case .level4:
            return .level5
        case .level5:
            return .level6
        case .level6:
            return .level7
        case .level7:
            return .level8
        case .level8:
            return .level9
        case .level9:
            return .level10
        case .level10:
            return .level11
        case .level11:
            return .level1
        }
    }
}

extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(Double(red) / 255.0)
        let newGreen = CGFloat(Double(green) / 255.0)
        let newBlue = CGFloat(Double(blue) / 255.0)

        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(1.0))
    }
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexValue = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexValue)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            let red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(hexNumber & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    var uiColor: UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        } else {
            let components = self.components()
            return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
        }
    }
    
    func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
