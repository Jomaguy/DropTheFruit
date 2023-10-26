//
//  FruitNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit

class FruitNode: SKNode {

    let type: FruitType

    init(type: FruitType) {
        self.type = type
        super.init()
        setup(type: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(type: FruitType) {
        let circleShape = SKShapeNode(circleOfRadius: type.radius)
        circleShape.fillColor = type.color
        addChild(circleShape)

        // Create a physics body for the player
        physicsBody = SKPhysicsBody(circleOfRadius: type.radius)
        physicsBody?.friction = 1
        physicsBody?.restitution = 0.11
        physicsBody?.mass = CGFloat.random(in: 4...6)
        physicsBody?.isDynamic = false
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = true
        physicsBody?.categoryBitMask = PhysicsCategory.Fruit
        physicsBody?.collisionBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box
        physicsBody?.contactTestBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box
    }
}
