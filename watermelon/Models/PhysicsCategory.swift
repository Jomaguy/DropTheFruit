//
//  PhysicsCategory.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import Foundation

struct PhysicsCategory {
    static let None: UInt32 = 0 /// No category (useful for some cases)
    static let Fruit: UInt32 = 1 << 0 /// Category for the fruit
    static let Box: UInt32 = 1 << 1 /// Category for the box
}
