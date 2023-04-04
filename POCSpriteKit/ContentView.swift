//
//  ContentView.swift
//  POCSpriteKit
//
//  Created by Paulo Henrique Gomes da Silva on 03/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = true
    var body: some View {
        NavigationView {
            NavigationLink(destination: GameView()) {
                Text("Iniciar Jogo")
            }
        }
            .navigationViewStyle(.stack)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
