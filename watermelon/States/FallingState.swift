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
        stateClass is SwipingState.Type || stateClass is GameOverState.Type
    }

    override func didEnter(from previousState: GKState?) {
        print("🔴 FallingState. Did enter.")
    }

    func handleContact(_ contact: SKPhysicsContact) {
        guard let fallingFruit, (fallingFruit === contact.bodyA.node || fallingFruit === contact.bodyB.node) else {
            return
        }
        let topThreshold = scene.size.height - BoxNode.Constants.insets.top
        self.fallingFruit?.name = FruitNode.Constants.fallenFruitName
        if fallingFruit.calculateAccumulatedFrame().midY > topThreshold {
            context.stateMachine?.enter(GameOverState.self)
        } else {
            self.fallingFruit = nil
            context.stateMachine?.enter(SwipingState.self)
        }
    }
}
