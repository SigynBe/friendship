import PlaygroundSupport 
import SpriteKit
import Dispatch
import Foundation

public func playUniversePart1() {
    
    class Universe1: SKScene {
        
        public var planet: SKSpriteNode?
        public var rebeca: SKSpriteNode?
        public var star: SKSpriteNode?
        var title : SKSpriteNode?
        var nextPage: SKButtonNode?
        var text1: SKSpriteNode?
        
        override public func sceneDidLoad() {
            super.sceneDidLoad()
            self.anchorPoint = .init(x: 0.5, y: 0.5)
            self.scaleMode = .aspectFill
            
            
            appearBackground()
            appearPlanet()
            appearCharacter()
            appearStar()
            appearText()
            playBackoundSons()
            
            
        }
        
        public func playBackoundSons() {             
            let music = SKAudioNode(fileNamed: "musicbackground.mpeg") 
            music.run(.play())
            music.run(SKAction.changeVolume(to: Float(0.1), duration: 0))
            self.addChild(music)        
            
        }
        
        func appearStar(){
            star = SKSpriteNode(imageNamed: "stars")
            star?.position = CGPoint(x: -3, y: 0)
            star?.setScale(0.35)
            
            self.addChild(star!)
            star?.addGlow()
            star?.run(.repeatForever(.sequence([
                .fadeIn(withDuration: 0.8),
                .fadeOut(withDuration: 0.8)
            ])))
            
            //              star?.run(.repeat(.sequence([
            //                  .fadeOut(withDuration: 0.8),
            //                  .fadeIn(withDuration: 0.8)
            //              ]), count: 5))
            //              star?.run(
            //                  SKAction.sequence([
            //                      SKAction.wait(forDuration: 7),
            //                      SKAction.removeFromParent()
            //                  ])
            //              )
            
        }
        
        func appearText() {
            text1 = SKSpriteNode(imageNamed: "task1")
            text1?.position = CGPoint(x: 0, y: 200)
            text1?.setScale(0)
            self.addChild(text1!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){ [self] in
                text1!.setScale(0.4)
                
            }
            
        }
        
        
        func appearBackground() {
            let tablet = SKSpriteNode(color: #colorLiteral(red: 0.07670103758573532, green: 0.10347244888544083, blue: 0.1623876988887787, alpha: 1.0), size: CGSize(width: 1325, height: 1999))
            tablet.setScale(1.05)
            self.addChild(tablet)
            
            //              tablet.run(.sequence([
            //                  .fadeOut(withDuration: 9.3)
            //              ]))
        }
        
        
        func appearPlanet(){
            planet = SKSpriteNode(imageNamed: "planet1.png")
            planet!.position = CGPoint(x: 10, y: 0)
            planet!.setScale(0.30)
            planet!.run(.group([
                .move(to: .init(x: 100, y: -150), duration: 3),
                .scale(by: 4.26, duration: 3)
            ]))
            self.addChild(planet!)
            
            //              planet?.run(.sequence([
            //                  .fadeOut(withDuration: 9.3)
            //              ]))
        }
        
        func appearRebeca(){
            rebeca = SKSpriteNode(imageNamed: "rebeca1")
            rebeca?.position = CGPoint(x: 40, y: 30)
            rebeca?.setScale(0.25)
            
            self.addChild(rebeca!)
        }
        
        func appearCharacter() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){ [self] in
                rebeca = SKSpriteNode(imageNamed: "rebeca")
                rebeca!.position = CGPoint(x: 80, y: -100)
                rebeca!.setScale(0.4)
                nextPage = SKButtonNode(image: rebeca!, label: SKLabelNode()){
                    PlaygroundPage.current.navigateTo(page: .next)
                }
                self.addChild(self.nextPage!)
            }
        }
        
        
    }
    var view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 518, height: 700)))
    var scene = Universe1(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
    
}

extension SKSpriteNode {
    func addGlow(radius: Float = 30) {
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", parameters: ["inputRadius":radius])
    }
}



