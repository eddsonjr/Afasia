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
        
        alertarExercicioEmCurso(irParaFeedback: false)
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
    
    
    func carregarFeedback(acertos: Int, erros: Int) {
        
    }
    
    
    func carregarTelaDeSelecaoDeExercicio() {
        print(dbgmsg + "Carregando a tela de selecao de cenarios do exercicio2")
        let controller = Exercicio2ViewController.instantiateFromStoryboard()
        self.present(controller, animated: true, completion: nil)
    
        
    }
    
    
    
    
    
    



}
