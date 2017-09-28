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
    
    
    //Mark: Mensagem de identificacao de bug e warnings
    private let dbgmsg = "[GameViewController]: "
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let scene = GKScene(fileNamed: "Exercicio3") {
            
            if let sceneNode = scene.rootNode as! Exercicio3? {
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
 
    
    
    //Mark: Funcao para alertar exercicio em curso
    func alertarExercicioEmCurso(irParaFeedback: Bool) {
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true
        )
        
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("Sair") {
            
            //escolhe se deseja carregar a tela de feedback ou sair para a tela anterior
            if irParaFeedback {
                print(self.dbgmsg + "Saindo do exercicio.Indo para o feedback")
                self.carregarFeedback()
            }else {
                print(self.dbgmsg + "Saindo do exercicio.Indo para a selecao de jogos")
                self.carregarTelaDeSelecaoDeExercicio()
            }
        }
        
        alert.showWarning("Sair do Exercício?", subTitle: "Você deseja realmente sair deste exercício?", closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xFED035, colorTextButton: 0x262626, animationStyle: .topToBottom)
        
    }

    
    
    //Mark: Funcoes de conformidade do MySpriteKitDelegate
    func carregarFeedback() {
        print(dbgmsg + "Carregando feedback [GAME DELEGATE]")
    }
    
    
    func carregarTelaDeSelecaoDeExercicio() {
        print(dbgmsg + "Carregando tela de selecao de exercicio [GAME DELEGATE]")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Exercicio2SelecaoCenas") as! Exercicio2ViewController
        
        //chamando controladora
        self.present(controller, animated: true, completion: nil)
        
    }

    
    
    
}
