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
    
    
    //Mark: view da cena
  
    
    
    //Mark: Responsavel por receber o codigo da cena  a ser carregada
    var cenaAserCarregada: Int = Int()
    
    //Mark: View responsavel por adqurir a cena do exercicio a ser carregada
    var viewDoExercicio:SKView? = nil
    
    //Mark: Mensagem de identificacao de bug
    private let dbgmsg = "[GameViewController]: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbgmsg + "Cena a ser carregada: \(cenaAserCarregada)")
        
        
       //escolhendo a cena do exercicio a ser carregada
        switch self.cenaAserCarregada {
        case 1:
            
            
            
            if let view = self.view as! SKView? {
            
                self.viewDoExercicio = view
                if let scene = Exercicio2Cena1(fileNamed: "Exercicio2Cena1") {
                    
                    scene.scaleMode = .aspectFill
                    
                    //conformando com o protocolo MySpriteKitDelegate
                    scene.mySpriteKitDelegate = self
                    
                    view.presentScene(scene)
                }
                
                view.ignoresSiblingOrder = true
                
            }
            
            
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
                    sceneNode.mySpriteKitDelegate = self
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

    
    
    //Mark: Funcoes de botoes [IBActions]
    @IBAction func voltarBTN(_ sender: Any) {
        carregarTelaDeSelecaoDeExercicio()
        
    }
    
    //Mark: Funcoes de conformidade do MySpriteKitDelegate
    func carregarFeedback() {
       //Essa funcao nao realiza nenhuma tarefa, apenas conforma com o protocolo
        
    }
    
    
    
    func carregarFeedback(acertos: Int, erros: Int) {
        AlertaHelper.alertarConclusaoExercicio {
            self.viewDoExercicio?.isPaused = true
            TrocarTelaHelper.chamarFeedbackTipo2(acertos: acertos, erros: erros, viewController: self)
        }
        
    }
    
    
    func carregarTelaDeSelecaoDeExercicio() {
        AlertaHelper.alertaSairExercicioEmCurso {
            self.viewDoExercicio?.isPaused = true
            TrocarTelaHelper.chamarTelaPrincipalDeSelecaoExercicios(viewController: self)
        }
    
        
    }
    
    
    
    
    
    



}
