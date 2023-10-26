//
//  FruitType.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import UIKit

enum FruitType {
    case level1
    case level2
    case level3
    case level4
    case level5
    case level6
    case level7
    case level8
    case level9
    case level10
    case level11

    var color: UIColor {
        switch self {
        case .level1:
            return .red
        case .level2:
            return .yellow
        case .level3:
            return .purple
        case .level4:
            return .brown
        case .level5:
            return .orange
        case .level6:
            return .red
        case .level7:
            return .blue
        case .level8:
            return .systemPink
        case .level9:
            return .yellow
        case .level10:
            return .purple
        case .level11:
            return .green
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
            return .level11
        }
    }
}
