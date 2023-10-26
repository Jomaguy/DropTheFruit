//
//  GameScene.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    unowned let context: GameContext

    private lazy var contactResovler = ContactResolver(scene: self)
    private let boxNode = BoxNode()
    private let scoreNode = ScoreNode()

    init(context: GameContext, size: CGSize) {
        self.context = context
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        isUserInteractionEnabled = true
        applyGravity()

        boxNode.setup(screenSize: size)
        boxNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(boxNode)

        scoreNode.position = CGPoint(x: 40, y: size.height - 100)
        addChild(scoreNode)

        context.layoutInfo = LayoutInfo(screenSize: size)
        context.stateMachine?.enter(SwipingState.self)
    }

    private func applyGravity() {
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        physicsWorld.contactDelegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context.stateMachine?.currentState as? SwipingState else {
            return
        }
        state.handleTouch(touch)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let state = context.stateMachine?.currentState as? SwipingState else {
            return
        }
        state.handleTouchMoved(touch)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let state = context.stateMachine?.currentState as? SwipingState else {
            return
        }
        state.handleTouchEnd()
    }

    func generateNewFruit() -> FruitNode {
        let types: [FruitType] = [.level1, .level1, .level1, .level2, .level2, .level2, .level2, .level2, .level3, .level3, .level3, .level4, .level4, .level5]
        let fruitNode = FruitNode(type: types.randomElement()!)
        fruitNode.position = CGPoint(x: size.width / 2, y: size.height - 150)
        addChild(fruitNode)
        return fruitNode
    }

    func reset() {
        context.gameInfo.score = 0
        scoreNode.updateScore(with: 0)
        children
            .compactMap { $0 as? FruitNode }
            .forEach { $0.removeFromParent() }
        context.stateMachine?.enter(SwipingState.self)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if let score = contactResovler.handle(contact: contact) {
            context.gameInfo.score += score
            scoreNode.updateScore(with: context.gameInfo.score)
        }
        guard let state = context.stateMachine?.currentState as? FallingState else {
            return
        }
        state.handleContact(contact)
    }
}
