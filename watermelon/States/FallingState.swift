//
//  FallingState.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import GameplayKit

class FallingState: GKState {
    unowned let scene: GameScene
    unowned let context: GameContext

    var fallingFruit: FruitNode?

    init(scene: GameScene, context: GameContext) {
        self.scene = scene
        self.context = context
        super.init()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is SwipingState.Type
    }

    override func didEnter(from previousState: GKState?) {
        print("🔴 FallingState. Did enter.")
    }

    func handleContact(_ contact: SKPhysicsContact) {
        guard let fallingFruit, (fallingFruit === contact.bodyA.node || fallingFruit === contact.bodyB.node) else {
            return
        }
        self.fallingFruit = nil
        context.stateMachine?.enter(SwipingState.self)
    }
}
