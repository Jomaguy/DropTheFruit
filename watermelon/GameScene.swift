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
    let boxNode = BoxNode()
    let scoreNode = ScoreNode()
    let evolutionNode = EvolutionNode()
    
    let fruitSprites = SKTextureAtlas(named: "FruitAtlas")
    
    init(context: GameContext, size: CGSize) {
        self.context = context
        super.init(size: size)
        
        fruitSprites.preload {
            print("fruit sprite preloaded")
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        isUserInteractionEnabled = true
        applyGravity()
        let bgNode = SKSpriteNode(imageNamed: "dtf_bg")
        bgNode.size = size
        bgNode.position = .init(x: size.width / 2.0, y: size.height / 2.0)
        addChild(bgNode)
        
        let ht = evolutionNode.setup(screenSize: size)
        evolutionNode.position = CGPoint(x: size.width/2.0, y: size.height / 2.0)
        addChild(evolutionNode)
        
        
        let imgSize = boxNode.setup(screenSize: size, bottom: ht)
        boxNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(boxNode)
        
        let boxFront = SKSpriteNode(imageNamed: "dtf_box_front")
        boxFront.zPosition = 99
        boxFront.size = .init(width: imgSize.width, height: imgSize.height * 0.9078947368)
        boxFront.position = .init(x: size.width / 2.0, y: boxFront.size.height / 2.0 + ht + BoxNode.Constants.bottomPadding - 1.5)
        addChild(boxFront)
        
        scoreNode.position = CGPoint(x: 40, y: size.height - 100)
        addChild(scoreNode)

        context.layoutInfo = LayoutInfo(screenSize: size)
        context.stateMachine?.enter(SwipingState.self)
    }

    private func applyGravity() {
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        //let's check for
        children
            .compactMap { $0 as? FruitNode }
            .forEach { fruitNode in
                if fruitNode.name == FruitNode.Constants.fallenFruitName, boxNode.isOverTop(fruit: fruitNode) {
                    print("did hit top")
//                    context.stateMachine?.enter(GameOverState.self)
                } else {
                    if let pos = boxNode.isLeft(fruit: fruitNode) {
                        fruitNode.position = pos
                    } else if let pos = boxNode.isRight(fruit: fruitNode) {
                        fruitNode.position = pos
                    } else if let pos = boxNode.isBottom(fruit: fruitNode) {
                        fruitNode.position = pos
                    }
                }
            }

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
        let types: [FruitType] = [.level1, .level1, .level2, .level2, .level3, .level3, .level3, .level4, .level4, .level5, .level5, .level5, .level5]
        let type: FruitType = types.randomElement() ?? .level1
        let fruitNode = FruitNode(type: type, texture: fruitSprites.textureNamed(type.textureName))
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
