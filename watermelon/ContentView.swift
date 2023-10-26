//
//  ContentView.swift
//  watermelon
//
//  Created by Hyung Lee on 10/25/23.
//

import GameplayKit
import SpriteKit
import SwiftUI

struct ContentView: View {

    let context = GameContext()

    var body: some View {
        ZStack {
            SpriteView(scene: context.scene, debugOptions: [])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
