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



    override func viewDidLoad() {
        super.viewDidLoad()
        
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
