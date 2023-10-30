//
//  BoxNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit

class BoxNode: SKNode {
    var boxBorderW: CGFloat = 0.0
    var boxSize: CGSize = .zero
    var boxImageSize: CGSize = .zero
    var boxImageBottom: CGFloat = 0

    func setup(screenSize: CGSize, bottom btm: CGFloat) -> CGSize {
        position = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)

        let hPadding = screenSize.width * Constants.paddingRatio
        let width = screenSize.width - hPadding * 2.0
        let height = width / Constants.boxRatio
        
        let node = SKSpriteNode(texture: .init(imageNamed: "dtf_box"))
        let boxImageWidth = screenSize.width - hPadding * 2.0
        let boxImageHeight = boxImageWidth / Constants.boxImageRatio
        let ogBorderWidth = 0.0206022187 * node.size.width
        
        let borderRatio = node.size.width / boxImageWidth
        let borderWidth = ogBorderWidth * borderRatio
        
        print("border ratio \(borderRatio)")
        
        boxBorderW = borderWidth
        
        boxImageSize = CGSize(width: boxImageWidth, height: boxImageHeight)
        node.size = boxImageSize
        let bottom = -1.0 * screenSize.height / 2.0 + boxImageHeight / 2.0 + btm + Constants.bottomPadding
        node.position = .init(x: 0, y: bottom)
        boxImageBottom = position.y + node.position.y - boxImageHeight / 2

        addChild(node)
        /// Left side
        createSideNode(
            origin: CGPoint(
                x: -screenSize.width / 2 + hPadding,
                y: -screenSize.height / 2 + btm + Constants.bottomPadding
            ),
            size: CGSize(width: borderWidth, height: height)
        )
        /// Right side
        createSideNode(
            origin: CGPoint(
                x: screenSize.width / 2 - hPadding - borderWidth,
                y: -screenSize.height / 2 + btm + Constants.bottomPadding
            ),
            size: CGSize(width: borderWidth, height: height)
        )
        /// Bottom side
        createSideNode(
            origin: CGPoint(
                x: -screenSize.width / 2 + hPadding,
                y: -screenSize.height / 2 + btm + Constants.bottomPadding
            ),
            size: CGSize(width: width, height: borderWidth)
        )
        
        let boxWidth = screenSize.width - borderWidth * 2 - hPadding * 2
        let boxHeight = boxWidth / Constants.boxRatio
        boxSize = .init(width: boxWidth, height: boxHeight)

        return boxImageSize
    }
    
    private func createSideNode(origin: CGPoint, size: CGSize) {
        let sideNode = SKShapeNode(rect: CGRect(origin: origin, size: size))
        sideNode.strokeColor = .clear
        sideNode.fillColor = .clear
        let center = CGPoint(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        sideNode.physicsBody = SKPhysicsBody(rectangleOf: size, center: center)
        sideNode.physicsBody?.isDynamic = false
        sideNode.physicsBody?.categoryBitMask = PhysicsCategory.Box
        sideNode.physicsBody?.collisionBitMask = PhysicsCategory.Fruit
        sideNode.physicsBody?.contactTestBitMask = PhysicsCategory.Fruit
        addChild(sideNode)
    }
    func isLeft(fruit: FruitNode) -> CGPoint? {
        if fruit.position.x + fruit.texture.size().width / 2.0 < position.x - boxSize.width / 2.0, !isOverTop(fruit: fruit) {
            return .init(x: position.x - boxSize.width / 2.0 + fruit.texture.size().width / 2.0, y: fruit.position.y)
        }
        return nil
    }
    func isRight(fruit: FruitNode) -> CGPoint? {
        if fruit.position.x - fruit.texture.size().width / 2.0 > position.x + boxSize.width / 2.0, !isOverTop(fruit: fruit) {
            return .init(x: position.x + boxSize.width / 2.0 - fruit.texture.size().width / 2.0, y: fruit.position.y)
        }
        return nil
    }
    func isBottom(fruit: FruitNode) -> CGPoint? {
        if fruit.position.y - fruit.texture.size().height / 2.0 < position.x - boxSize.height / 2.0 {
            return .init(x: fruit.position.x, y: position.y - boxSize.height / 2.0 + fruit.texture.size().height / 2.0)
        }
        return nil
    }
    func isOverTop(fruit: FruitNode) -> Bool {
        let closeBoxHeight = boxSize.width / Constants.closerBoxRatio
        return fruit.position.y - fruit.texture.size().height / 2.0 > position.y - boxSize.height / 2.0 + closeBoxHeight
    }
}

extension BoxNode {
    enum Constants {
        static let closerBoxRatio = 0.885
        static let boxRatio = 0.8
        static let paddingRatio = 0.03287671233 //relative to screen width
        
        static let boxImageRatio = 0.8007614213
        
        static let side: CGFloat = 5
        static let bottomPadding = 10.0
    }
}
