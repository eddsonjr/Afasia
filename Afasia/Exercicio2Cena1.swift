//
//  ReconhecimentoObejtosCenaGameScene.swift
//  Afasia
//
//  Created by Edson  Jr on 12/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit


class Exercicio2Cena1: SKScene{
    
    
    private let dbgmsg = "[RecObjCena1]: "
    
    //Mark: Variaveis de sprites na tela
    var tvAreaReconhecimento: SKSpriteNode?
    var sofaAreaReconhecimento: SKSpriteNode?
    var acertouTvIcon: SKSpriteNode?
    var acertouSofaIcon: SKSpriteNode?
    
    
    
    
    override func sceneDidLoad() {
        
        
    }
    
    override func didMove(to view: SKView) {
        print(self.dbgmsg + "Dentro de didMove")
        
        self.tvAreaReconhecimento = self.childNode(withName: "tvAreaReconhecimento") as? SKSpriteNode
        self.sofaAreaReconhecimento = self.childNode(withName: "sofaAreaReconhecimento") as? SKSpriteNode
        
        self.acertouTvIcon = self.childNode(withName: "acertoTv") as? SKSpriteNode
        self.acertouSofaIcon = self.childNode(withName: "acertoSofa") as? SKSpriteNode
        
        

        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if (self.tvAreaReconhecimento?.contains(location))!{
                print(dbgmsg + "O usuario conseguiu encontrar a tv")
                self.acertouTvIcon?.alpha = 1
            }
            if (self.sofaAreaReconhecimento?.contains(location))!{
                print(dbgmsg + "O usuario conseguiu encontrar a tv")
                self.acertouSofaIcon?.alpha = 1
            }
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    
    func touchsEndOrCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    
    
    override func update(_ currentTime: CFTimeInterval) {

        
    }
    
    
 
    
    
    
    
    
}
