//
//  LayoutInfo.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import Foundation

struct LayoutInfo {
    let screenSize: CGSize

    func getSwipingRange(for fruitType: FruitType) -> ClosedRange<CGFloat> {
        let leftBound = BoxNode.Constants.insets.left + BoxNode.Constants.side + fruitType.radius
        let rightBound = screenSize.width - BoxNode.Constants.insets.right - BoxNode.Constants.side - fruitType.radius
        return leftBound...rightBound
    }
}
