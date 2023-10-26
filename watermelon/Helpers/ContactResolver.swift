//
//  ContactResolver.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

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

        let centeredPosition = CGPoint(
            x: (leftFruit.position.x + rightFruit.position.x) / 2,
            y: (leftFruit.position.y + rightFruit.position.y) / 2
        )
        let nextFruit = FruitNode(type: leftFruit.type.next)
        nextFruit.physicsBody?.isDynamic = true
        nextFruit.position = centeredPosition

        leftFruit.removeFromParent()
        rightFruit.removeFromParent()
        scene.addChild(nextFruit)
        return leftFruit.type.score
    }
}
