//
//  BoxNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit

class BoxNode: SKNode {
    func setup(screenSize: CGSize) {
        let leftSideNode = SKShapeNode(
            rect: CGRect(
                origin: CGPoint(
                    x: -screenSize.width / 2 + Constants.insets.left,
                    y: -screenSize.height / 2 + Constants.insets.bottom
                ),
                size: CGSize(width: Constants.side, height: screenSize.height - Constants.insets.top - Constants.insets.bottom)
            )
        )
        leftSideNode.fillColor = .yellow
        addChild(leftSideNode)
        let rightSideNode = SKShapeNode(
            rect: CGRect(
                origin: CGPoint(
                    x: screenSize.width / 2 - Constants.insets.right - Constants.side,
                    y: -screenSize.height / 2 + Constants.insets.bottom
                ),
                size: CGSize(width: Constants.side, height: screenSize.height - Constants.insets.top - Constants.insets.bottom)
            )
        )
        rightSideNode.fillColor = .yellow
        addChild(rightSideNode)
        let bottomSideNode = SKShapeNode(
            rect: CGRect(
                origin: CGPoint(
                    x: -screenSize.width / 2 + Constants.insets.left,
                    y: -screenSize.height / 2 + Constants.insets.bottom
                ),
                size: CGSize(width: screenSize.width - Constants.insets.left - Constants.insets.right, height: Constants.side)
            )
        )
        bottomSideNode.fillColor = .yellow
        addChild(bottomSideNode)
    }
}

extension BoxNode {
    enum Constants {
        static let side: CGFloat = 20
        static let insets = UIEdgeInsets(top: 200, left: 20, bottom: 100, right: 20)
    }
}
