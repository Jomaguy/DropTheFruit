//
//  ContactResolver.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import CoreHaptics
import SpriteKit

class ContactResolver {
    private let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }

    func handle(contact: SKPhysicsContact) -> Int? {
        guard
            let leftFruit = contact.bodyA.node as? FruitNode,
            let rightFruit = contact.bodyB.node as? FruitNode,
            leftFruit.type == rightFruit.type
        else {
            return 0
        }

        UIImpactFeedbackGenerator(style: .light).impactOccurred(intensity: 0.85)
        let centeredPosition = CGPoint(
            x: (leftFruit.position.x + rightFruit.position.x) / 2,
            y: (leftFruit.position.y + rightFruit.position.y) / 2
        )
        let type = leftFruit.type.next
        let nextFruit = FruitNode(type: type, texture: scene.fruitSprites.textureNamed(type.textureName))
        nextFruit.enablePhysics()
        nextFruit.position = centeredPosition
        nextFruit.name = FruitNode.Constants.fallenFruitName

        makeExplosion(node: leftFruit)
        leftFruit.removeFromParent()
        makeExplosion(node: rightFruit)
        rightFruit.removeFromParent()
        scene.addChild(nextFruit)
        applyImpulseForNearbyFruits(newFruit: nextFruit)
        return leftFruit.type.score
    }

    private func makeExplosion(node: FruitNode) {
        let emitter = SKEmitterNode()
        emitter.zPosition = 13
        emitter.particleBirthRate = node.type.birthrate
        emitter.numParticlesToEmit = node.type.numParticle
        emitter.particleLifetime = 0.2
        emitter.emissionAngle = CGFloat(90.0).degreesToRadians()
        emitter.emissionAngleRange = CGFloat(360.0).degreesToRadians()
        emitter.particleRotationRange = CGFloat(360.0).degreesToRadians()
        emitter.particleRotationSpeed = CGFloat(360.0).degreesToRadians()
        emitter.particleSpeed = 60
        emitter.particleSpeedRange = 100
        emitter.particleAlpha = 1.0
        emitter.particleAlphaRange = 0.25
        emitter.particlePositionRange = CGVector(dx: 1.2 * node.type.radius, dy: 1.2 * node.type.radius)
        emitter.particleScale = 0.4
        emitter.particleScaleRange = 0.2
        emitter.particleScaleSpeed = -0.3
        emitter.particleBlendMode = SKBlendMode.alpha
        emitter.particleColorBlendFactor = 1.0
        emitter.particleColor = node.type.color
        emitter.position = node.position
        emitter.particleSize = CGSize(width: node.type.particleSize, height: node.type.particleSize)
        scene.addChild(emitter)
    }

    private func applyImpulseForNearbyFruits(newFruit: FruitNode) {
        scene.children
            .compactMap { $0 as? FruitNode }
            .filter { $0.position.distance(to: newFruit.position) < ($0.radius + newFruit.radius + 25) }
            .forEach { fruitNode in
                let vector = CGVector(
                    dx: 55 * (fruitNode.position.x - newFruit.position.x),
                    dy: 55 * (fruitNode.position.y - newFruit.position.y)
                )
                fruitNode.physicsBody?.applyImpulse(vector)
            }
    }
}

private extension CGPoint {
    // Calculate the distance between two points
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(point.x - x, 2) + pow(point.y - y, 2))
    }
}

private extension CGFloat {
    func degreesToRadians() -> CGFloat {
        CGFloat.pi * self / 180.0
    }
}
