//
//  GameContext.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import Combine
import GameplayKit
import SwiftUI

class GameContext {

    private(set) var scene: GameScene!
    private(set) var stateMachine: GKStateMachine?

    init() {
        self.scene = GameScene(context: self, size: UIScreen.main.bounds.size)
        configureStates()
    }

    func configureStates() {
        stateMachine = GKStateMachine(
            states: [
//                UPStationaryState(scene: scene, context: self),
//                UPMovingUpState(scene: scene, context: self),
//                UPMovingDownState(scene: scene, context: self),
//                UPWaitingState(scene: scene, context: self),
//                UPGameOverState(scene: scene, context: self)
            ]
        )
    }
}
