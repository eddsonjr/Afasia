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
    
    var i = 0
    
    //Mark: Variaveis de sprites na tela
    var tvAreaReconhecimento: SKSpriteNode?
    var sofaAreaReconhecimento: SKSpriteNode?
    var acertouTvIcon: SKSpriteNode?
    var acertouSofaIcon: SKSpriteNode?
    var sofaMiniatura: SKSpriteNode?
    var tvMiniatura: SKSpriteNode?
    
    //Mark: lista de sprites a serem achados
    var listaDeSpritesASeremAchados: [SKSpriteNode] = []
    
    
    //Mark: variaveis que computam a quantidade de acertos e erros
    var acertos = 0
    var erros = 0
    
    
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
            
            if verificarSpritePressionado(location: location){
                self.erros = self.erros+1
            }
            
            print(dbgmsg + "Quantidade de acertos: \(self.acertos) | Erros: \(self.erros)")
            
            
            
        }
        
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    func touchsEndOrCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        chamarFeedback()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        chamarFeedback()
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
        
        self.listaDeSpritesASeremAchados.append(self.tvAreaReconhecimento!)
        self.listaDeSpritesASeremAchados.append(self.sofaAreaReconhecimento!)
    }
    
    
    
    //Esta funcao serve para verificar se o usuario clicou nas areas das figuras que
    //devem ser computadas como certas. Caso o clique tenha sido fora de alguma dessas areas
    //a funcao retonara indicando que se deve computar erro
    func verificarSpritePressionado(location: CGPoint) -> Bool{
        var computarErro: Bool = true
        
        
        if (self.tvAreaReconhecimento?.contains(location))!{
            self.acertos = self.acertos+1
            self.tvMiniatura?.fadeOut25()
            computarErro = false
            listaDeSpritesASeremAchados.removeFirstEqualItem(item: tvAreaReconhecimento!)
            print(dbgmsg + "Itens restantes a serem achados: \(self.listaDeSpritesASeremAchados.count)")
        }
        
        if(self.sofaAreaReconhecimento?.contains(location))!{
            self.acertos = self.acertos+1
            self.sofaMiniatura?.fadeOut25()
            computarErro = false
            
            listaDeSpritesASeremAchados.removeFirstEqualItem(item: sofaAreaReconhecimento!)
            print(dbgmsg + "Itens restantes a serem achados: \(self.listaDeSpritesASeremAchados.count)")
        }
        
        return computarErro
    }
    
    
    
    
    //Esta funcao verifica se ainda existem itens a serem achados, caso nao haja
    //chama a tela de feedback
    func chamarFeedback(){
        
        if self.listaDeSpritesASeremAchados.count <= 0 {
            self.view?.isPaused = true
            mySpriteKitDelegate?.carregarFeedback(acertos: self.acertos, erros: self.erros)
        }
        
    }
    
    
    
    
    
}
