//
//  GameViewController.swift
//  watermelon
//
//  Created by Oleksii Andriushchenko on 26.10.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    let context = GameContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = context.scene {
            if let view = self.view as? SKView {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
