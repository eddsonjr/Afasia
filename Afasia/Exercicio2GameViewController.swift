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



class Exercicio2GameViewController: UIViewController,MySpriteKitDelegate {
    
    
    var cenaAserCarregada: Int = Int()
    
    private let dbgmsg = "[GameViewController]: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + "Cena a ser carregada: \(cenaAserCarregada)")
        
        
       //escolhendo a cena do exercicio a ser carregada
        switch self.cenaAserCarregada {
        case 1:
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
            } //fecha o if let scene = GKScene...
            
            
        case 2:
            if let scene = GKScene(fileNamed: "Exercicio2Cena2") {
                
                if let sceneNode = scene.rootNode as! Exercicio2Cena2? {
                    sceneNode.scaleMode = .aspectFill
                    if let view = self.view as! SKView? {
                        print(dbgmsg + "Carregando spritekit...")
                        view.presentScene(sceneNode)
                        
                        view.ignoresSiblingOrder = true
                        
                        view.showsFPS = true
                        view.showsNodeCount = true
                    }
                }
                
                
            } //fecha o if let scene = GKScene...
            
            
        case 3:
            if let scene = GKScene(fileNamed: "Exercicio2Cena3") {
                
                if let sceneNode = scene.rootNode as! Exercicio2Cena3? {
                    sceneNode.scaleMode = .aspectFill
                    if let view = self.view as! SKView? {
                        print(dbgmsg + "Carregando spritekit...")
                        view.presentScene(sceneNode)
                        
                        view.ignoresSiblingOrder = true
                        
                        view.showsFPS = true
                        view.showsNodeCount = true
                    }
                }
                
                
            } //fecha o if let scene = GKScene...

            
            
            
        default:
            print(dbgmsg + "ERRO: NAO EXISTE ESSA CENA...")
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
    
    
    
    
    
    
    
    
    
    //Mark: Funcoes de conformidade do MySpriteKitDelegate
    func carregarFeedback() {
        
    }
    
    
    func carregarTelaDeSelecaoDeExercicio() {
        
    }
    



}
