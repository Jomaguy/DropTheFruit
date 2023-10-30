//
//  EvolutionNode.swift
//  watermelon
//
//  Created by Hyung Lee on 10/29/23.
//

import SpriteKit

class EvolutionNode: SKNode {
    
    func setup(screenSize: CGSize) -> CGFloat {
        //should return height of the bottom
        //0.1774383079
        
        let height = screenSize.height * 0.1774383079
        let node = SKShapeNode(rectOf: .init(width: screenSize.width, height: height))
        node.position.y = -1.0 * screenSize.height / 2.0 + height / 2.0
        node.fillColor = UIColor(hex: "FAFAFA")
        addChild(node)
        
        let arrow = SKSpriteNode(imageNamed: "dtf_arrow")
        arrow.position.y = node.position.y + 10.0
        addChild(arrow)
        
        var fruitList: [(FruitNode,CGFloat)] = []
        for type in FruitType.allCases {
            let texture = SKTexture(imageNamed: type.textureName)
            let evoFruitNode = FruitNode(type: type, texture: texture, scale: type.evolutionScale)
            evoFruitNode.position.y = arrow.position.y
            addChild(evoFruitNode)
            let fWidth = evoFruitNode.radius * 2.0
            fruitList.append((evoFruitNode, fWidth))
        }
        
        let totalWidth = fruitList.reduce(0, { $0 + $1.1 }) + CGFloat(fruitList.count - 1)
        var startX = -1.0 * totalWidth / 2.0
        for  (i, info) in fruitList.enumerated() {
            // Position fruit
            if i == 0 {
                info.0.position.x = startX
            } else {
                info.0.position.x = startX + info.1 / 2.0
            }
                
            startX = info.0.position.x + info.1 / 2.0
        }

        return height
    }
}

