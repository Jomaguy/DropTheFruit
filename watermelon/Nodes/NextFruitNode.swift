//
//  NextFruitNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 30.10.2023.
//

import SpriteKit

class NextFruitNode: SKNode {

    private let circleNode = SKShapeNode(circleOfRadius: Constants.circleRadius)

    func setup(screenSize: CGSize) {
        let size = CGSize(width: 2 * Constants.circleRadius, height: 2 * Constants.circleRadius + 4 + 14)
        position = CGPoint(x: 17 + size.width / 2, y: screenSize.height - 33 - size.height / 2)

        circleNode.position = CGPoint(x: 0, y: -9)
        circleNode.fillColor = .white
        circleNode.strokeColor = UIColor(named: "1672c4") ?? .clear
        addChild(circleNode)

        let textNode = SKLabelNode()
        textNode.position = CGPoint(x: 0, y: (size.height / 2) - 7)
        textNode.attributedText = NSAttributedString(
            string: "NEXT",
            attributes: [
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 12, weight: .bold)
            ]
        )
        addChild(textNode)
    }

    func update(fruitNode: FruitNode) {
        circleNode.children.forEach { $0.removeFromParent() }
        circleNode.addChild(fruitNode)
    }
}

extension NextFruitNode {
    enum Constants {
        static let circleRadius: CGFloat = 35
        static let fruitSize: CGSize = CGSize(width: 40, height: 40)
    }
}
