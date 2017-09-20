//
//  GameViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 12/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit



class GameViewController: UIViewController {
    
    
    
    private let dbgmsg = "[GameViewController]: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let scene = GKScene(fileNamed: "Exercicio2Cena1") {
            
            if let sceneNode = scene.rootNode as! Exercicio2Cena1? {
                sceneNode.scaleMode = .aspectFill
                if let view = self.view as! SKView? {
                    print(dbgmsg + "Carregando spritekit...")
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

        
        
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override var prefersStatusBarHidden: Bool {
        return true

        
    }



}
