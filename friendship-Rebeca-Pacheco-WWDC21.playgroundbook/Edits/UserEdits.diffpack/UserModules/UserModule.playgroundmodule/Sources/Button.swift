import PlaygroundSupport
import Foundation
import SpriteKit

class SKButtonNode: SKNode {
    var imagem: SKSpriteNode?
    var label: SKLabelNode?
    var action: (() -> Void)?
    
    init(image: SKSpriteNode, label: SKLabelNode, action: @escaping () -> Void){
        self.imagem = image
        self.label = label
        self.action = action
        super.init()
        self.isUserInteractionEnabled = true
        
        self.addChild(image)
        self.addChild(label)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
}

