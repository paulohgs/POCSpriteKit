//
//  PongScene.swift
//  POCSpriteKit
//
//  Created by Paulo Henrique Gomes da Silva on 03/04/23.
//
import SpriteKit
import GameplayKit

class PongScene: SKScene {

    var player: SKSpriteNode = SKSpriteNode()
    var opponent: SKSpriteNode = SKSpriteNode()
    var ball: SKSpriteNode = SKSpriteNode()
    let force: CGFloat = 8

    override func didMove(to view: SKView) {
        // settings nodes in scene
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
        opponent = self.childNode(withName: "opponent") as! SKSpriteNode
        player.position.x = (-self.frame.width/2) + 70
        opponent.position.x = self.frame.width/2 - 70

        let border = SKPhysicsBody(edgeLoopFrom: self.frame)

        border.friction = .zero
        border.restitution = 1
        physicsBody = border

        startGame()
    }

    func startGame() {
        ball.physicsBody?.applyImpulse(CGVector(dx: force, dy: force))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count >= 2 {
            isPaused.toggle()
            print(isPaused)
        }
        for touch in touches {
            let location = touch.location(in: self)

            if location.x < 0 {
                player.run(SKAction.moveTo(y: location.y, duration: 0.1))
            } else if location.x > 0 {
                opponent.run(SKAction.moveTo(y: location.y, duration: 0.1))
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if location.x < 0 {
                player.run(SKAction.moveTo(y: location.y, duration: 0.1))
            } else if location.x > 0 {
                opponent.run(SKAction.moveTo(y: location.y, duration: 0.1))
            }
        }
    }

    override func update(_ currentTime: TimeInterval) {
        //
    }
}
