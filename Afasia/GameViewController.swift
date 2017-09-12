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
        
        self.view = SKView()
        let skView = view as! SKView
        
        
        if let view = self.view as! SKView? {
            if let scene = ReconhecimentoObjetosCena1(fileNamed: "ReconhecimentoObejtosCena1") {
                print(self.dbgmsg + "Carregando cena 1 exercicio 2")
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
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
