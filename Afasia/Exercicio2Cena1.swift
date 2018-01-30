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
    var sofaMiniatura: SKSpriteNode?
    var tvMiniatura: SKSpriteNode?
    
    //Mark: lista de sprites a serem achados
    var listaDeSpritesASeremAchados: [SKSpriteNode]?
    
    
    
    //Mark: Variavel do delegate
    var mySpriteKitDelegate: MySpriteKitDelegate?
    
    
    override func sceneDidLoad() {
        
        
    }
    
    override func didMove(to view: SKView) {
        print(self.dbgmsg + "Dentro de didMove")
        setupSprites()

    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            
            if (self.tvAreaReconhecimento?.contains(location))!{
                print(dbgmsg + "O usuario conseguiu encontrar a tv")
                self.tvMiniatura?.fadeOut25()
                self.listaDeSpritesASeremAchados?.removeFirstEqualItem(item: self.tvAreaReconhecimento!)
                
            }else if (self.sofaAreaReconhecimento?.contains(location))!{
                print(dbgmsg + "O usuario conseguiu encontrar a tv")
                self.sofaMiniatura?.fadeOut25()
                self.listaDeSpritesASeremAchados?.removeFirstEqualItem(item: self.sofaAreaReconhecimento!)
                
            }else{
                print(dbgmsg + "O usuario errou o clique")
                self.tvMiniatura?.piscarPararAcesso()
                self.sofaMiniatura?.piscarPararAcesso()
               
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
    
    
    
    //mark: Funcoes
    
    //Configura os sprites da tela do jogo
    func setupSprites(){
    
        self.tvAreaReconhecimento = self.childNode(withName: "tvAreaReconhecimento") as? SKSpriteNode
        self.sofaAreaReconhecimento = self.childNode(withName: "sofaAreaReconhecimento") as? SKSpriteNode
        self.acertouTvIcon = self.childNode(withName: "acertoTv") as? SKSpriteNode
        self.acertouSofaIcon = self.childNode(withName: "acertoSofa") as? SKSpriteNode
        self.sofaMiniatura = self.childNode(withName: "sofaDescricaoSprite") as? SKSpriteNode
        self.tvMiniatura = self.childNode(withName: "tvDescricaoSprite") as? SKSpriteNode
        
        self.listaDeSpritesASeremAchados?.append(self.tvAreaReconhecimento!)
        self.listaDeSpritesASeremAchados?.append(self.sofaAreaReconhecimento!)
    }
    
    
    
    func computarAcertosErros(listaDeSprites: [SKSpriteNode],ponto: CGPoint,acaoAcerto: ()->(),acaoErro:()->(),terminoExercicio:()->()){
        
        
        if listaDeSpritesASeremAchados != nil{
            for sprite in listaDeSpritesASeremAchados! {
                if sprite.contains(ponto){
                    listaDeSpritesASeremAchados?.removeFirstEqualItem(item: sprite)
                    acaoAcerto()
                }
            }
        }else{
            terminoExercicio()
        }
        
    }
    

    
    
 
    
    
    
    
    
}
