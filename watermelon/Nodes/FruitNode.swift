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
        setup(type: type, texture: texture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForEvolution() {
        self.physicsBody = nil
    }
    
    func physicsBody(forFruitType type: FruitType, texture: SKTexture) -> SKPhysicsBody {
        let textureSize = texture.size()

        switch type {
        case .level1:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .level4:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .level5:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .level6:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -4.0))
        case .level7:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -3.0))
        case .level9:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -2.0))
        case .level10:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -8.5))
        case .level11:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0, center: .init(x: 0, y: -4))

        default:
            return SKPhysicsBody(circleOfRadius: textureSize.width / 2.0)
        }
    }
    
    private func setup(type: FruitType, texture: SKTexture) {
        let fruitTexture = SKTexture(imageNamed: type.textureName)
        let fruitShape = SKSpriteNode(texture: fruitTexture)
        fruitShape.setScale(scale)
        radius = fruitShape.size.width / 2.0
        addChild(fruitShape)
        
        // Create a physics body for the player
        physicsBody = physicsBody(forFruitType: type, texture: texture)
        physicsBody?.friction = 0.2
        physicsBody?.restitution = 0.1
        physicsBody?.mass = type.mass
        physicsBody?.isDynamic = false
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = true
        physicsBody?.categoryBitMask = PhysicsCategory.Fruit
        physicsBody?.collisionBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box
        physicsBody?.contactTestBitMask = PhysicsCategory.Fruit | PhysicsCategory.Box

        name = Constants.fruitName
    }
}

extension FruitNode {
    enum Constants {
        static let fruitName = "fruit"
        static let fallenFruitName = "fallen_fruit"
    }
}
