//
//  FruitNode.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit

class FruitNode: SKNode {
    let type: FruitType
    var radius: CGFloat
    let texture: SKTexture
    var scale: CGFloat

    init(type: FruitType, texture: SKTexture, scale: CGFloat = 1.0) {
        self.type = type
        self.texture = texture
        self.scale = scale
        self.radius = 0.0
        super.init()
        setup(type: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func enablePhysics() {
        physicsBody = physicsBody(forFruitType: type, texture: texture)
        physicsBody?.friction = 0.2
        physicsBody?.restitution = 0.1
        physicsBody?.mass = type.mass
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = true
        physicsBody?.categoryBitMask = PhysicsCategory.Fruit
        physicsBody?.collisionBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box
        physicsBody?.contactTestBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box
    }
    
    private func setup(type: FruitType) {
        let fruitShape = SKSpriteNode(texture: texture)
        fruitShape.setScale(scale)
        radius = fruitShape.size.width / 2.0
        addChild(fruitShape)
        name = Constants.fruitName
    }

    private func physicsBody(forFruitType type: FruitType, texture: SKTexture) -> SKPhysicsBody {
        let textureSize = texture.size()

        switch type {
        case .cherry:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .orange:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .apple:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .pear:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -4.0))
        case .passion:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -3.0))
        case .melon:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .pineapple:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -8.5))
        case .watermelon:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -4))

        default:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0)
        }
    }
}

extension FruitNode {
    enum Constants {
        static let fruitName = "fruit"
        static let fallenFruitName = "fallen_fruit"
    }
}
