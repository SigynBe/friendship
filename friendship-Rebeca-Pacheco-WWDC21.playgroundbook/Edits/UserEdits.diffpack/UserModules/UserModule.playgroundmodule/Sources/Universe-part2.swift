import PlaygroundSupport 
import SpriteKit
import Dispatch
import Foundation

public func playUniversePart2() {
    
    class Universe2: SKScene{
        var room: SKSpriteNode?
        var rebeca: SKSpriteNode?
        var ale: SKSpriteNode?
        var table: SKSpriteNode?
        var textAlert: SKSpriteNode?
        var textTask: SKSpriteNode?
        var button: SKSpriteNode?
        var nextPage: SKButtonNode?
        
        var playMessage = 0
        
        override public func sceneDidLoad() {
            super.sceneDidLoad()
            self.anchorPoint = .init(x: 0.5, y: 0.5)
            self.scaleMode = .aspectFill
            appearRoom() 
            appearRebeca()
            appearAle()
            appearTable1()
            appearTable2()
            appearTable3()
            appearTable4()
            appearTextTesk()
            playBackoundSons()
        }
        
        public func playBackoundSons() {             
            let music = SKAudioNode(fileNamed: "musicbackground.mpeg") 
            music.run(.play())
            music.run(SKAction.changeVolume(to: Float(0.1), duration: 0))
            self.addChild(music)        
            
        }
        
        override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let location = touches.first?.location(in: rebeca!), 
               location.x <= 150 && location.x > -150 && 
                location.y <= 150 && location.y > -150 {
                if rebeca!.position.y < 0 {
                    rebeca?.run(.move(to: .init(x: -140, y: 40), duration: 1.5))
                    ale?.run(.move(to: .init(x: 60, y: -200), duration: 1.5))
                }
                else {
                    rebeca?.run(.move(to: .init(x: 100, y: -220), duration: 1.5))
                    ale?.run(.move(to: .init(x: -140, y: -180), duration: 1.5))
                }
                playMessage = playMessage + 1
                if playMessage == 3 {
                    textAlert = SKSpriteNode(imageNamed: "textAlert1")
                    textAlert?.setScale(0.3)
                    textAlert!.name = "textAlert1"
                    self.textAlert!.position = CGPoint(x: 0, y: -100)
                    self.addChild(self.textAlert!)
                    button = SKSpriteNode(imageNamed: "buttonDay")
                    button!.position = CGPoint(x: 185, y: -250)
                    button!.setScale(0.3)
                    nextPage = SKButtonNode(image: button!, label: SKLabelNode()){
                        PlaygroundPage.current.navigateTo(page: .next)}     
                    self.addChild(self.nextPage!)
                    
                }
                
            }
        }
        
        func appearTextTesk() {
            textTask = SKSpriteNode(imageNamed: "task2")
            textTask?.position = CGPoint(x: 0, y: 80)
            textTask?.setScale(0)
            self.addChild(textTask!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
                textTask!.setScale(0.2)
                
            }
            
        }
        
        
        func appearTable1(){
            table = SKSpriteNode(imageNamed: "table")
            table?.position = CGPoint(x: 75, y: -40)
            table?.setScale(0.2)
            
            self.addChild(table!)
        }
        func appearTable2(){
            table = SKSpriteNode(imageNamed: "table")
            table?.position = CGPoint(x: -125, y: 0)
            table?.setScale(0.2)
            self.addChild(table!)
        }
        func appearTable3(){
            table = SKSpriteNode(imageNamed: "table")
            table?.position = CGPoint(x: -125, y: -210)
            table?.setScale(0.2)
            
            self.addChild(table!)
        }
        func appearTable4(){
            table = SKSpriteNode(imageNamed: "table")
            table?.position = CGPoint(x: 75, y: -250)
            table?.setScale(0.2)
            
            self.addChild(table!)
        }
        
        func appearRebeca(){
            rebeca = SKSpriteNode(imageNamed: "rebeca1")
            rebeca?.position = CGPoint(x: 100, y: -10)
            rebeca?.setScale(0.25)
            
            self.addChild(rebeca!)
        }
        
        func appearAle(){
            ale = SKSpriteNode(imageNamed: "ale")
            ale?.position = CGPoint(x: -140, y: 40)
            ale?.setScale(0.25)
            
            self.addChild(ale!)
        }
        
        func appearRoom() {
            room = SKSpriteNode(imageNamed: "roomOficial")
            room?.position = CGPoint(x: -3, y: 0)
            room?.setScale(0.35)
            self.addChild(room!)
        }
        
        func appearButton() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){ [self] in
                button = SKSpriteNode(imageNamed: "buttonDay")
                button!.position = CGPoint(x: 80, y: -100)
                button!.setScale(0.4)
                nextPage = SKButtonNode(image: button!, label: SKLabelNode()){
                    PlaygroundPage.current.navigateTo(page: .next)
                }
                self.addChild(self.nextPage!)
            }
        }
        
        
    }
    var view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 518, height: 700)))
    var scene = Universe2(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
    
}

