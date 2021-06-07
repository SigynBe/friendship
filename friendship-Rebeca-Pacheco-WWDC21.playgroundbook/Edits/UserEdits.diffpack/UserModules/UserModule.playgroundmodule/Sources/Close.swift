
import PlaygroundSupport 
import SpriteKit
import Dispatch
import Foundation

public func playClose() {
    
    class Close: SKScene{
        
        var sceneChat: SKSpriteNode?
        var button1: SKSpriteNode?
        var button2: SKSpriteNode?
        var nextPage: SKButtonNode?
        var rebeca: SKSpriteNode?
        var task4: SKSpriteNode?
        var button: SKSpriteNode?
        
        var click = false
        
        override public func sceneDidLoad() {
            super.sceneDidLoad()
            self.anchorPoint = .init(x: 0.5, y: 0.5)
            self.scaleMode = .aspectFill
            appearSceneChat()
            buttonChat1()
            buttonChat2()
            appearTask()
            appearButton()
            playBackoundSons()
        }
        
        public func playBackoundSons() {             
            let music = SKAudioNode(fileNamed: "musicbackground.mpeg") 
            music.run(.play())
            music.run(SKAction.changeVolume(to: Float(0.1), duration: 0))
            self.addChild(music)        
            
        }
        
        
        func appearTask(){
            task4 = SKSpriteNode(imageNamed: "task4")
            task4?.position = CGPoint(x: 0, y: -250)
            task4?.setScale(0.25)
            
            self.addChild(task4!)
        }
        
        func appearSceneChat() {
            sceneChat = SKSpriteNode(imageNamed: "sceneChat")
            sceneChat?.position = CGPoint(x: -3, y: 0)
            sceneChat?.setScale(0.35)
            self.addChild(sceneChat!)
            
        }
        func buttonChat1() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
                button1 = SKSpriteNode(imageNamed: "chatRebeca1")
                button1!.position = CGPoint(x: -125, y: -150)
                button1!.setScale(0.2)
                
                nextPage = SKButtonNode(image: button1!, label: SKLabelNode()){
                    sceneChat = SKSpriteNode(imageNamed: "chatAle1")
                    sceneChat?.position = CGPoint(x: 125, y: 10)
                    sceneChat?.setScale(0.2)
                    self.addChild(sceneChat!)
                }
                self.addChild(self.nextPage!)
            }
        }
        
        
        
        func buttonChat2() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
                button2 = SKSpriteNode(imageNamed: "chatRebeca2")
                button2!.position = CGPoint(x: -125, y: -70)
                button2!.setScale(0.2)
                
                nextPage = SKButtonNode(image: button2!, label: SKLabelNode()){
                    click = true
                    sceneChat = SKSpriteNode(imageNamed: "chatAle2")
                    sceneChat?.position = CGPoint(x: 125, y: 10)
                    sceneChat?.setScale(0.2)
                    self.addChild(sceneChat!)                    
                }
                self.addChild(self.nextPage!)
            }
        }
        
        func appearButton() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6){ [self] in
                button = SKSpriteNode(imageNamed: "next")
                button!.position = CGPoint(x: 170, y: 120)
                button!.setScale(0.3)
                nextPage = SKButtonNode(image: button!, label: SKLabelNode()){
                    PlaygroundPage.current.navigateTo(page: .next)
                }
                self.addChild(self.nextPage!)
            }
        }
        
        
        
    }
    var view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 518, height: 700)))
    var scene = Close(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
}


