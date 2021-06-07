import PlaygroundSupport 
import SpriteKit
import Dispatch
import Foundation

public func playAnotherDay() {
    
    class AnotherDay: SKScene{
        var room: SKSpriteNode?
        var table: SKSpriteNode?
        var rebeca: SKSpriteNode?
        var ale: SKSpriteNode?
        var textImage: SKSpriteNode?
        var idea: SKSpriteNode?
        var game: SKSpriteNode?
        var phone: SKSpriteNode?
        var sprites:[SKSpriteNode]?
        var textAlert: SKSpriteNode?
        var textTask: SKSpriteNode?
        var nextPage: SKButtonNode?
        var button: SKSpriteNode?
        var juliana: SKSpriteNode?
        
        var tableobject0 = false
        var tableobject1 = false
        var tableobject2 = false
        var tableobject3 = false
        var firstTime = true
        
        var movableNode : SKNode? 
        
        override public func sceneDidLoad() {
            super.sceneDidLoad()
            self.anchorPoint = .init(x: 0.5, y: 0.5)
            self.scaleMode = .aspectFill
            
            appearRoom()
            appearRebeca()
            appearAle()
            appearJuliana()
            appearTable()
            
            textImage = SKSpriteNode(imageNamed: "textImage")
            textImage?.position = CGPoint(x: -200, y: 200)
            textImage?.setScale(0.3)
            self.addChild(textImage!)
            
            idea = SKSpriteNode(imageNamed: "ideia")
            idea?.position = CGPoint(x: 200, y: 100)
            idea?.setScale(0.3)
            self.addChild(idea!)
            
            game = SKSpriteNode(imageNamed: "game")
            game?.position = CGPoint(x: 200, y: 200)
            game?.setScale(0.3)
            self.addChild(game!)
            
            phone = SKSpriteNode(imageNamed: "phone")
            phone?.position = CGPoint(x: -200, y: -200)
            phone?.setScale(0.3)
            self.addChild(phone!)
            
            sprites = [
                textImage!,
                idea!,
                game!,
                phone!
            ]
            
            
            appearTextTesk()
            playBackoundSons()
        }
        
        public func playBackoundSons() {             
            let music = SKAudioNode(fileNamed: "musicbackground.mpeg") 
            music.run(.play())
            music.run(SKAction.changeVolume(to: Float(0.1), duration: 0))
            self.addChild(music)        
            
        }
        
        func appearTextTesk() {
            textTask = SKSpriteNode(imageNamed: "task3")
            textTask?.position = CGPoint(x: 0, y: -200)
            textTask?.setScale(0)
            self.addChild(textTask!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
                textTask!.setScale(0.3)
                
            }
            
        }
        
        
        //essa é uma função que será usada para verificar o node clicado e, então, mudar a posição dele. Ela é uma função "filha" da função 'touchesBegan'
        func verifyTouch(touch: UITouch){
            
            //aqui está sendo captada a localização do toque na tela
            let location = touch.location(in: self)
            
            for node in sprites!{
                
                if node == sprites![0] && node.position.x >= -100 && node.position.y <= 30 || node == sprites![0] && node.position.x >= 20 && node.position.y <= 60
                    && node.position.y <= -10{
                    if node.position != CGPoint(x: -25, y: 0){
                        node.position = CGPoint(x: -25, y: 0)
                        print("em cima da mesa 0")
                        tableobject0 = true
                    }
                    
                    continue
                }else if node == sprites![1] && node.position.x >= -100 && node.position.y <= 30 || node == sprites![1] && node.position.x >= 20 && node.position.y <= 60
                && node.position.y <= -10{
                    if node.position != CGPoint(x: -25, y: 0){
                        node.position = CGPoint(x: -25, y: 0)
                        print("em cima da mesa 1")
                        tableobject1 = true
                    }
                    
                    continue
                    
                }
                else if node == sprites![2] && node.position.x >= -100 && node.position.y <= 30 || node == sprites![2] && node.position.x >= 20 && node.position.y <= 60
                            && node.position.y <= -10{
                    if node.position != CGPoint(x: -25, y: 0){
                        node.position = CGPoint(x: -25, y: 0)
                        print("em cima da mesa 2")
                        tableobject2 = true
                    }
                    
                    continue
                    
                }
                else if node == sprites![3] && node.position.x >= -100 && node.position.y <= 30 || node == sprites![3] && node.position.x >= 20 && node.position.y <= 60
                            && node.position.y <= -10{
                    if node.position != CGPoint(x: -25, y: 0){
                        node.position = CGPoint(x: -25, y: 0)
                        print("em cima da mesa 3")
                        tableobject3 = true
                    }
                    
                    continue
                    
                }
                
                else{
                    if node.contains(location){
                        movableNode = node
                        movableNode!.position = location
                    }
                }
            }
            
            if tableobject0 && tableobject1 && tableobject2 && tableobject3 && firstTime {
                textAlert = SKSpriteNode(imageNamed: "textAlert2")
                textAlert?.position = CGPoint(x: 0, y: 0)
                textAlert?.setScale(0.5)
                self.addChild(textAlert!)
                
                button = SKSpriteNode(imageNamed: "buttonNext")
                button!.position = CGPoint(x: 140, y: -88)
                button!.setScale(0.2)
                nextPage = SKButtonNode(image: button!, label: SKLabelNode()){
                    PlaygroundPage.current.navigateTo(page: .next)}     
                self.addChild(self.nextPage!)
                
                
            }
            
            //a seguir estamos pegando cada um dos SKSpriteNode's contidos no nosso array de sprites e chamando cada um, isoladamente, de 'node', desse modo o que acontece: é verificado se esse node está na posição em que o user realizou o toque e, se essa condição for verdadeira, o nosso node auxiliar (movableNode) passa a receber os valores do nosso node e, então, realiza-se a troca de posição (drag)
//              for node in sprites! {
//                  if node.contains(location){
//                      movableNode = node
//                      movableNode!.position = location
//                      
//                      
//                  }
//              }
            
        }
        
        
        //Essa função verifica se houve um toque na tecla e, se houve, ela chama a função 'verifyTouch', passando por parâmetro todas as informações do toque. 
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                verifyTouch(touch: touch)
            }
        }
        
        
        //aqui essa função é chamada sempre que o nosso node for clicado e movido, dessa forma ele realiza o drag 
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first, movableNode != nil {
                movableNode!.position = touch.location(in: self)
            }
        }
        
        
        //essa função é chamada quando o drag finaliza, ou seja: o drop acontece. Dessa forma, o sprite assume a nova posição na qual ele foi colocado
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first, movableNode != nil {
                movableNode!.position = touch.location(in: self)
                movableNode = nil
            }
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                movableNode = nil
            }
        }
        
        func appearRoom() {
            room = SKSpriteNode(imageNamed: "roomOficial")
            room?.position = CGPoint(x: -3, y: 0)
            room?.setScale(0.35)
            self.addChild(room!)
            
        }
        
        func appearTable(){
            table = SKSpriteNode(imageNamed: "table")
            table?.position = CGPoint(x: -25, y: -40)
            table?.setScale(0.45)
            
            self.addChild(table!)
        }
        
        func appearRebeca(){
            rebeca = SKSpriteNode(imageNamed: "rebeca1")
            rebeca?.position = CGPoint(x: 40, y: 30)
            rebeca?.setScale(0.25)
            
            self.addChild(rebeca!)
        }
        
        func appearJuliana(){
            juliana = SKSpriteNode(imageNamed: "Ju")
            juliana?.position = CGPoint(x: -100, y: 30)
            juliana?.setScale(0.6)
            
            self.addChild(juliana!)
        }
        
        func appearAle(){
            ale = SKSpriteNode(imageNamed: "ale")
            ale?.position = CGPoint(x: -25, y: 30)
                //ale?.position = CGPoint(x: -100, y: 30)
            ale?.setScale(0.25)
            
            self.addChild(ale!)
        }
        
    }
    
    
    var view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 518, height: 700)))
    var scene = AnotherDay(size: view.frame.size)
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
    
}

