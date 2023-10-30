//
//  LayoutInfo.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import Foundation

struct LayoutInfo {
    let screenSize: CGSize

    func getSwipingRange(for fruit: FruitNode, inBox box: BoxNode) -> ClosedRange<CGFloat> {
        
        let leftBound = box.position.x - box.boxSize.width / 2.0 + fruit.texture.size().width / 2.0 + 1
        let rightBound = box.position.x + box.boxSize.width / 2.0 - fruit.texture.size().width / 2.0 - 1
        return leftBound...rightBound
    }
}
