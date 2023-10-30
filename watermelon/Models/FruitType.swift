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
    case cherry
    case blueberry
    case lime
    case orange
    case apple
    case pear
    case passion
    case coconut
    case melon
    case pineapple
    case watermelon
    
    var textureName: String {
        switch self {
        case .cherry:
            return "dtf_cherry"
        case .blueberry:
            return "dtf_blueberry"
        case .lime:
            return "dtf_lime"
        case .orange:
            return "dtf_orange"
        case .apple:
            return "dtf_apple"
        case .pear:
            return "dtf_pear"
        case .passion:
            return "dtf_passion"
        case .coconut:
            return "dtf_coco"
        case .melon:
            return "dtf_melon"
        case .pineapple:
            return "dtf_pineapple"
        case .watermelon:
            return "dtf_wm"
        }
    }
    
    var color: UIColor {
        switch self {
        case .cherry:
            return .init(hex: "B20603")
        case .blueberry:
            return .init(hex: "1672C4")
        case .lime:
            return .init(hex: "42B940")
        case .orange:
            return .init(hex: "F9CEB2")
        case .apple:
            return .init(hex: "E4241F")
        case .pear:
            return .init(hex: "FFCE71")
        case .passion:
            return .init(hex: "FFAAB6")
        case .coconut:
            return .init(hex: "D3784A")
        case .melon:
            return .init(hex: "CED84C")
        case .pineapple:
            return .init(hex: "F0B813")
        case .watermelon:
            return .init(hex: "00C527")
        }
    }
    var evolutionScale: CGFloat {
        switch self {
        case .cherry:
            return 0.50
        case .blueberry:
            return 0.50
        case .lime:
            return 0.35
        case .orange:
            return 0.35
        case .apple:
            return 0.35
        case .pear:
            return 0.31
        case .passion:
            return 0.30
        case .coconut:
            return 0.26
        case .melon:
            return 0.27
        case .pineapple:
            return 0.25
        case .watermelon:
            return 0.25
        }
    }
    var mass: CGFloat {
        switch self {
        case .cherry:
            return 12
        case .blueberry:
            return 15
        case .lime:
            return 18
        case .orange:
            return 23
        case .apple:
            return 30
        case .pear:
            return 30
        case .passion:
            return 35
        case .coconut:
            return 40
        case .melon:
            return 50
        case .pineapple:
            return 55
        case .watermelon:
            return 60
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .cherry:
            return 10
        case .blueberry:
            return 20
        case .lime:
            return 30
        case .orange:
            return 40
        case .apple:
            return 50
        case .pear:
            return 60
        case .passion:
            return 70
        case .coconut:
            return 80
        case .melon:
            return 90
        case .pineapple:
            return 100
        case .watermelon:
            return 110
        }
    }

    var particleSize: CGFloat {
        switch self {
        case .cherry:
            return 7
        case .blueberry:
            return 8
        case .lime:
            return 9
        case .orange:
            return 10
        case .apple:
            return 11
        case .pear:
            return 12
        case .passion:
            return 14
        case .coconut:
            return 15
        case .melon:
            return 16
        case .pineapple:
            return 17
        case .watermelon:
            return 18
        }
    }
    
    var birthrate: CGFloat {
        switch self {
        case .cherry:
            return 30
        case .blueberry:
            return 120
        case .lime:
            return 300
        case .orange:
            return 330
        case .apple:
            return 380
        case .pear:
            return 410
        case .passion:
            return 450
        case .coconut:
            return 500
        case .melon:
            return 800
        case .pineapple:
            return 1000
        case .watermelon:
            return 1200
        }
    }
    var numParticle: Int {
        switch self {
        case .cherry:
            return 5
        case .blueberry:
            return 30
        case .lime:
            return 50
        case .orange:
            return 60
        case .apple:
            return 80
        case .pear:
            return 100
        case .passion:
            return 150
        case .coconut:
            return 170
        case .melon:
            return 220
        case .pineapple:
            return 280
        case .watermelon:
            return 300
        }
    }
    var score: Int {
        switch self {
        case .cherry:
            return 1
        case .blueberry:
            return 3
        case .lime:
            return 6
        case .orange:
            return 10
        case .apple:
            return 15
        case .pear:
            return 21
        case .passion:
            return 28
        case .coconut:
            return 36
        case .melon:
            return 45
        case .pineapple:
            return 55
        case .watermelon:
            return 66
        }
    }

    var next: FruitType {
        switch self {
        case .cherry:
            return .blueberry
        case .blueberry:
            return .lime
        case .lime:
            return .orange
        case .orange:
            return .apple
        case .apple:
            return .pear
        case .pear:
            return .passion
        case .passion:
            return .coconut
        case .coconut:
            return .melon
        case .melon:
            return .pineapple
        case .pineapple:
            return .watermelon
        case .watermelon:
            return .cherry
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
