//
//  SwipingState.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import GameplayKit

class SwipingState: GKState {
    unowned let scene: GameScene
    unowned let context: GameContext

    private var isInteractingWithFruit = false
    private var isSwiping = false
    private var lastPosition: CGPoint = .zero
    private var fruitNode: FruitNode?

    init(scene: GameScene, context: GameContext) {
        self.scene = scene
        self.context = context
        super.init()
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        stateClass is FallingState.Type
    }

    override func didEnter(from previousState: GKState?) {
        print("🔴 SwipingState. Did enter.")
        fruitNode = scene.generateNewFruit()
    }

    func handleTouch(_ touch: UITouch) {
        lastPosition = touch.location(in: scene)
    }

    func handleTouchMoved(_ touch: UITouch) {
        guard let fruitNode else {
            return
        }
        isSwiping = true
        let newPosition = touch.location(in: scene)
        let deltaX = newPosition.x - lastPosition.x
        let updatedPositionX = fruitNode.position.x + deltaX
        let allowedRange = context.layoutInfo.getSwipingRange(for: fruitNode.type)
        let clampedPositionX = max(allowedRange.lowerBound, min(updatedPositionX, allowedRange.upperBound))
        fruitNode.position.x = clampedPositionX
        lastPosition = newPosition
    }

    func handleTouchEnd() {
        if isSwiping {
            isSwiping = false
        } else {
            fruitNode?.physicsBody?.isDynamic = true
            context.stateMachine?.enter(FallingState.self)
            if let fallingState = context.stateMachine?.state(forClass: FallingState.self) {
                fallingState.fallingFruit = fruitNode
            }
        }
    }
}
