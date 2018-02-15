//
//  SKspriteNode+extension+animations.swift
//  Afasia
//
//  Created by Edson  Jr on 29/01/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


extension SKSpriteNode {
    
    //Animacao de fazer um sprite piscar e parar acesso (com alpha em 1)
    func piscarPararAcesso() {
        
        let fadeOutAnimation = SKAction.fadeAlpha(to: 0.25, duration: 0.5)
        let fadeInAntimation = SKAction.fadeAlpha(to: 1, duration: 0.5)
        let sequence = SKAction.sequence([fadeOutAnimation,fadeInAntimation,fadeOutAnimation,fadeInAntimation,
                                          fadeOutAnimation,fadeInAntimation])
        self.run(sequence)
        
    }
    
    
    
    //Esmaecer um sprite ate ele ficar com alpha igual a 0.25
    func fadeOut25(){
        let fadeOutAnimation = SKAction.fadeAlpha(to: 0.25, duration: 0.5)
        self.run(fadeOutAnimation)
    }
    
    
}
