//
//  GameView.swift
//  POCSpriteKit
//
//  Created by Paulo Henrique Gomes da Silva on 03/04/23.
//
import SpriteKit
import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    @State var dismissView: Bool = false

    var scene: SKScene {
        guard let scene = PongScene(fileNamed: "PongScene") else {
            preconditionFailure("File scene doesn't exists.")
        }
        scene.size = .zero
        scene.scaleMode = .resizeFill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene, debugOptions: [.showsFPS, .showsNodeCount])
        .navigationBarBackButtonHidden()
        .onChange(of: dismissView,
                  perform: ({ newValue in
            dismiss()
        }))
        .ignoresSafeArea()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
