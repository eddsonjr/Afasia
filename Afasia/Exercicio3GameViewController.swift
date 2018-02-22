//
//  Exercicio3GameViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 27/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit



class Exercicio3GameViewController: UIViewController,MySpriteKitDelegate {
    
 
    
    //Mark: View responsavel por adqurir a cena do exercicio a ser carregada
    var viewDoExercicio:SKView? = nil
    
    //Mark: Mensagem de identificacao de bug e warnings
    private let dbgmsg = "[GameViewController]: "
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GKScene(fileNamed: "Exercicio3") {
        
            
            if let sceneNode = scene.rootNode as! Exercicio3? {
                
                sceneNode.scaleMode = .aspectFill
                if let view = self.view as! SKView? {
                    self.viewDoExercicio = view
                    
                    
                    print(dbgmsg + "Carregando spritekit...")
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
                sceneNode.mySpriteKitDelegate = self
            }
            
            
        } //fecha o if let scene = GKScene...

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {}

    override var shouldAutorotate: Bool {return true }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    override var prefersStatusBarHidden: Bool { return true }
 

    
    
    //Mark: Funcoes de conformidade do MySpriteKitDelegate
    
    func carregarFeedback() {
      //Esta funcao nao realiza nenhuma acao, somente conforma com protocolo
        
    }
    
    
    //carrega a tela de feedback passando a quantidade de acertos e erros
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
    
    
    
    //chama a tela de principal do aplicativo de selecao de exercicios
    @IBAction func VoltarParaTelaPrincipal(_ sender: Any) {
        carregarTelaDeSelecaoDeExercicio()
    }
    
    
    

    
    
    
}
