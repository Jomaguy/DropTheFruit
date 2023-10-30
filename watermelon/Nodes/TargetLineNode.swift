//
//  TargetLineNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 30.10.2023.
//

import CoreGraphics
import SpriteKit

class TargetLineNode: SKNode {
    func setup(screenSize: CGSize, boxBottom: CGFloat, height: CGFloat) {
        position = CGPoint(x: screenSize.width / 2, y: boxBottom)
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: height))
        let length: [CGFloat] = [6, 2]
        let dashedPath = bezierPath.cgPath.copy(dashingWithPhase: 1, lengths: length)
        let node = SKShapeNode(path: dashedPath)
        node.strokeColor = .white
        node.lineWidth = 2
        addChild(node)
    }
}
