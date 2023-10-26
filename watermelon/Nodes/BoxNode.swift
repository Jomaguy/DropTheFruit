//
//  BoxNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit

class BoxNode: SKNode {
    func setup(screenSize: CGSize) {
        /// Left side
        createSideNode(
            origin: CGPoint(
                x: -screenSize.width / 2 + Constants.insets.left,
                y: -screenSize.height / 2 + Constants.insets.bottom
            ),
            size: CGSize(width: Constants.side, height: screenSize.height - Constants.insets.top - Constants.insets.bottom)
        )
        /// Right side
        createSideNode(
            origin: CGPoint(
                x: screenSize.width / 2 - Constants.insets.right - Constants.side,
                y: -screenSize.height / 2 + Constants.insets.bottom
            ),
            size: CGSize(width: Constants.side, height: screenSize.height - Constants.insets.top - Constants.insets.bottom)
        )
        /// Bottom side
        createSideNode(
            origin: CGPoint(
                x: -screenSize.width / 2 + Constants.insets.left,
                y: -screenSize.height / 2 + Constants.insets.bottom
            ),
            size: CGSize(width: screenSize.width - Constants.insets.left - Constants.insets.right, height: Constants.side)
        )
    }

    private func createSideNode(origin: CGPoint, size: CGSize) {
        let sideNode = SKShapeNode(rect: CGRect(origin: origin, size: size))
        sideNode.fillColor = .yellow
        let center = CGPoint(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        sideNode.physicsBody = SKPhysicsBody(rectangleOf: size, center: center)
        sideNode.physicsBody?.isDynamic = false
        sideNode.physicsBody?.categoryBitMask = PhysicsCategory.Box
        sideNode.physicsBody?.collisionBitMask = PhysicsCategory.Fruit
        sideNode.physicsBody?.contactTestBitMask = PhysicsCategory.Fruit
        addChild(sideNode)
    }
}

extension BoxNode {
    enum Constants {
        static let side: CGFloat = 20
        static let insets = UIEdgeInsets(top: 200, left: 20, bottom: 100, right: 20)
    }
}
