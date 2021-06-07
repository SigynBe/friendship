import PlaygroundSupport 
import SpriteKit
import Dispatch
import Foundation

public func playThankYou() {
    
    class ThankYou: SKScene{
        
        var grid: SKSpriteNode?
        var light: SKSpriteNode?
        var photo1: SKSpriteNode?
        var photo2: SKSpriteNode?
        var textEnd: SKSpriteNode?
        
        
        override public func sceneDidLoad() {
            super.sceneDidLoad()
            self.anchorPoint = .init(x: 0.5, y: 0.5)
            self.scaleMode = .aspectFill
            
            appearGrid()
            appearLight()
            appearPhoto1()
            appearPhoto2()
            appearTExtEnd()
            playBackoundSons()
        }
        
        
    
    public func playBackoundSons() {             
        let music = SKAudioNode(fileNamed: "musicbackground.mpeg") 
        music.run(.play())
        music.run(SKAction.changeVolume(to: Float(0.1), duration: 0))
        self.addChild(music)        
        
    }
        
        func appearPhoto1() {
            photo1 = SKSpriteNode(imageNamed: "photo1")
            photo1?.position = CGPoint(x: -60, y: -18)
            photo1?.setScale(0.4)
            self.addChild(photo1!)
        }
        func appearPhoto2() {
            photo2 = SKSpriteNode(imageNamed: "photo2")
            photo2?.position = CGPoint(x: 60, y: -18)
            photo2?.setScale(0)
            self.addChild(photo2!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){ [self] in
                photo2!.setScale(0.4)
                
            }
        }
        
        func appearTExtEnd() {
            textEnd = SKSpriteNode(imageNamed: "textEnd")
            textEnd?.position = CGPoint(x: 0, y: -200)
            textEnd?.setScale(0)
            self.addChild(textEnd!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){ [self] in
                textEnd!.setScale(0.4)
                
            }
        }
        
        func appearGrid() {
            grid = SKSpriteNode(imageNamed: "end")
            grid?.position = CGPoint(x: -3, y: 0)
            grid?.setScale(0.35)
            self.addChild(grid!)
        }
        func appearLight(){
            light = SKSpriteNode(imageNamed: "light")
            light?.position = CGPoint(x: -3, y: 73)
            light?.setScale(0.35)
            
            self.addChild(light!)
            light?.addGlow()
            light?.run(.repeatForever(.sequence([
                .fadeIn(withDuration: 0.8),
                .fadeOut(withDuration: 0.8)
            ])))
        }
        
        
    }
    var view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 518, height: 700)))
    var scene = ThankYou(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
}

