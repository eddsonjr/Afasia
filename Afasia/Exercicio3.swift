//
//  Exercicio3.swift
//  Afasia
//
//  Created by Edson  Jr on 27/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class Exercicio3: SKScene {
    
    
    //Mark: Lista de nodes que estao na tela
    //Variaveis dos botoes que representam cada letra
    var A_Button: SKSpriteNode?
    var B_Button: SKSpriteNode?
    var C_Button: SKSpriteNode?
    var D_Button: SKSpriteNode?
    var E_Button: SKSpriteNode?
    var F_Button: SKSpriteNode?
    var G_Button: SKSpriteNode?
    var H_Button: SKSpriteNode?
    var I_Button: SKSpriteNode?
    var J_Button: SKSpriteNode?
    var K_Button: SKSpriteNode?
    var L_Button: SKSpriteNode?
    var M_Button: SKSpriteNode?
    var N_Button: SKSpriteNode?
    var O_Button: SKSpriteNode?
    var P_Button: SKSpriteNode?
    var Q_Button: SKSpriteNode?
    var R_Button: SKSpriteNode?
    var S_Button: SKSpriteNode?
    var T_Button: SKSpriteNode?
    var U_Button: SKSpriteNode?
    var V_Button: SKSpriteNode?
    var W_Button: SKSpriteNode?
    var X_Button: SKSpriteNode?
    var Y_Button: SKSpriteNode?
    var Z_Button: SKSpriteNode?
    
    
    //variavel que representa a imagem em si
    var Imagem: SKSpriteNode?
    
    //variavel que representa o botao de refazer a palavra inteira
    var RefazerButton: SKSpriteNode?
    
    //Variavel que representa o botao de voltar a ultima letra
    var VoltarLetraButton: SKSpriteNode?
    
    
    //Variavel que representa a Label com o nome da imagem a ser digitado
    var NomeImagem: SKLabelNode?
    
    
    //Variaveis que informam a quantidade de imagens totais do exercicio e
    //a quantidade de imagens ja realizadas
    var labelContadorTotal: SKLabelNode?
    var labelContadorAtual: SKLabelNode?
    
    
    //Variavel que ira servir de texto para o nome da imagem, que sera colocado em Nome_Imagem
    var nomeDaImagemASerFormada: String!
    
    
    //Mensagem de debug
    var dbgmsg = "[EXEC3_GAMESCENE]: "
    
    
    //Variavel que ira controlar a quantidade de caracteres que tem a palavra, servindo para controlar
    //quando a palavra escrita pelo usuario ja foi completada
    var qtAtualDeCaracteres = 0
    
    
    
    
    //As variaveis abaixo indicam a quantidade de acertos e erros que ocorreram
    var acertos = 0
    var erros = 0
    
    //A lista abaixo serve para armazenar as imagens que foram coletadas do Store
    var listaDeImagens: [ImagemExercicio] = []
    var indiceAtual = 0 //indica a posicao atual das imagens na lista
    
    
    
    //Variaveis do tipo alerta
    var alerta: SCLAlertView? = nil
    
    
    
    
    //Mark: Variavel do delegate
    var mySpriteKitDelegate: MySpriteKitDelegate?
    
    
    
    
    
    
    override func didMove(to view: SKView) {
        carregarDiversasImagens(imagens: ImagemExercicioStore.getAllImagensExecs(), qtImagens: 3)
        //carregando diversas imagens do Store
        
        
        setupSprites()//configurando o que sera mostrado na cena
        
        
        
    }
    
    
    
    override func sceneDidLoad() {
        
        
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            verificarBotoesTocados(point: location)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        colocarTexturasOriginaisLetras()
        
        
        
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    
    
    //Mark: Funcoes
    
    //Esta funcao configura as variaveis acima que irao aparecer na tela
    func setupSprites() {
        
        self.A_Button = self.childNode(withName: "A_Button") as? SKSpriteNode
        self.B_Button = self.childNode(withName: "B_Button") as? SKSpriteNode
        self.C_Button = self.childNode(withName: "C_Button") as? SKSpriteNode
        self.D_Button = self.childNode(withName: "D_Button") as? SKSpriteNode
        self.E_Button = self.childNode(withName: "E_Button") as? SKSpriteNode
        self.F_Button = self.childNode(withName: "F_Button") as? SKSpriteNode
        self.G_Button = self.childNode(withName: "G_Button") as? SKSpriteNode
        self.H_Button = self.childNode(withName: "H_Button") as? SKSpriteNode
        self.I_Button = self.childNode(withName: "I_Button") as? SKSpriteNode
        self.J_Button = self.childNode(withName: "J_Button") as? SKSpriteNode
        self.K_Button = self.childNode(withName: "K_Button") as? SKSpriteNode
        self.L_Button = self.childNode(withName: "L_Button") as? SKSpriteNode
        self.M_Button = self.childNode(withName: "M_Button") as? SKSpriteNode
        self.N_Button = self.childNode(withName: "N_Button") as? SKSpriteNode
        self.O_Button = self.childNode(withName: "O_Button") as? SKSpriteNode
        self.P_Button = self.childNode(withName: "P_Button") as? SKSpriteNode
        self.Q_Button = self.childNode(withName: "Q_Button") as? SKSpriteNode
        self.R_Button = self.childNode(withName: "R_Button") as? SKSpriteNode
        self.S_Button = self.childNode(withName: "S_Button") as? SKSpriteNode
        self.T_Button = self.childNode(withName: "T_Button") as? SKSpriteNode
        self.U_Button = self.childNode(withName: "U_Button") as? SKSpriteNode
        self.V_Button = self.childNode(withName: "V_Button") as? SKSpriteNode
        self.W_Button = self.childNode(withName: "W_Button") as? SKSpriteNode
        self.X_Button = self.childNode(withName: "X_Button") as? SKSpriteNode
        self.Y_Button = self.childNode(withName: "Y_Button") as? SKSpriteNode
        self.Z_Button = self.childNode(withName: "Z_Button") as? SKSpriteNode
        
        
        self.Imagem = self.childNode(withName: "Imagem") as? SKSpriteNode
        self.RefazerButton = self.childNode(withName: "Refazer_Button") as? SKSpriteNode
        self.VoltarLetraButton = self.childNode(withName: "Voltar_Button") as? SKSpriteNode
        self.NomeImagem = self.childNode(withName: "Nome_Palavra") as? SKLabelNode
        self.NomeImagem?.text = ""
        self.nomeDaImagemASerFormada = ""
        
        
    
        self.labelContadorTotal = self.childNode(withName: "contador_total") as? SKLabelNode
        self.labelContadorAtual = self.childNode(withName: "contador_atual") as? SKLabelNode
        self.labelContadorAtual?.text = String(self.indiceAtual)
        self.labelContadorTotal?.text = String(describing: self.listaDeImagens.count)
        
        
        //Colocando a imagem como textura para ser mostrada na tela
        let texture = trocarTextura(imagem: (self.listaDeImagens.first?.asset)!)
        self.Imagem?.texture = texture
        
    }
    
    
    
    //Esta funcao serve para verificar quais as letras e botoes foram pressionados pelo usuario e
    //prover as resposta aos toques correspondentes
    func verificarBotoesTocados(point: CGPoint){
        if (self.A_Button?.contains(point))!{
            print(dbgmsg + "Letra A pressionada")
            self.A_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "A_selecionado"))
            criarNomeImagem(letra: "A")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
            
        }else if (self.B_Button?.contains(point))!{
            print(dbgmsg + "Letra B pressionada")
            self.B_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "B_selecionado"))
            criarNomeImagem(letra: "B")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
            
        }else if (self.C_Button?.contains(point))! {
            print(dbgmsg + "Letra C pressionada")
            self.C_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "C_selecionado"))
            criarNomeImagem(letra: "C")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
            
            
        }else if (self.D_Button?.contains(point))! {
            print(dbgmsg + "Letra D pressionada")
            self.D_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "D_selecionado"))
            criarNomeImagem(letra: "D")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.E_Button?.contains(point))! {
            print(dbgmsg + "Letra E pressionada")
            self.E_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "E_selecionado"))
            criarNomeImagem(letra: "E")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.F_Button?.contains(point))! {
            print(dbgmsg + "Letra F pressionada")
            self.F_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "F_selecionado"))
            criarNomeImagem(letra: "F")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.G_Button?.contains(point))! {
            print(dbgmsg + "Letra G pressionada")
            self.G_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "G_selecionado"))
            criarNomeImagem(letra: "G")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.H_Button?.contains(point))! {
            print(dbgmsg + "Letra H pressionada")
            self.H_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "H_selecionado"))
            criarNomeImagem(letra: "H")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.I_Button?.contains(point))! {
            print(dbgmsg + "Letra I pressionada")
            self.I_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "I_selecionado"))
            criarNomeImagem(letra: "I")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.J_Button?.contains(point))! {
            print(dbgmsg + "Letra J pressionada")
            self.J_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "J_selecionado"))
            criarNomeImagem(letra: "J")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.K_Button?.contains(point))! {
            print(dbgmsg + "Letra K pressionada")
            self.K_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "K_selecionado"))
            criarNomeImagem(letra: "K")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.L_Button?.contains(point))! {
            print(dbgmsg + "Letra L pressionada")
            self.L_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "L_selecionado"))
            criarNomeImagem(letra: "L")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.M_Button?.contains(point))! {
            print(dbgmsg + "Letra M pressionada")
            self.M_Button?.texture = trocarTextura(imagem:#imageLiteral(resourceName: "M_selecionado"))
            criarNomeImagem(letra: "M")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.N_Button?.contains(point))! {
            print(dbgmsg + "Letra N pressionada")
            self.N_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "N_selecionado"))
            criarNomeImagem(letra: "N")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.O_Button?.contains(point))! {
            print(dbgmsg + "Letra O pressionada")
            self.O_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "O_selecionado"))
            criarNomeImagem(letra: "O")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.P_Button?.contains(point))! {
            print(dbgmsg + "Letra P pressionada")
            self.P_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "P_selecionado"))
            criarNomeImagem(letra: "P")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.Q_Button?.contains(point))! {
            print(dbgmsg + "Letra Q pressionada")
            self.Q_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Q_selecionado"))
            criarNomeImagem(letra: "Q")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.R_Button?.contains(point))! {
            print(dbgmsg + "Letra R pressionada")
            self.R_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "R_selecionado"))
            criarNomeImagem(letra: "R")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.S_Button?.contains(point))! {
            print(dbgmsg + "Letra S pressionada")
            self.S_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "S_selecionado"))
            criarNomeImagem(letra: "S")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.T_Button?.contains(point))! {
            print(dbgmsg + "Letra T pressionada")
            self.T_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "T_selecionado"))
            criarNomeImagem(letra: "T")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.U_Button?.contains(point))! {
            print(dbgmsg + "Letra U pressionada")
            self.U_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "U_selecionado"))
            criarNomeImagem(letra: "U")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.V_Button?.contains(point))! {
            print(dbgmsg + "Letra V pressionada")
            self.V_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "V_selecionado"))
            criarNomeImagem(letra: "V")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.W_Button?.contains(point))! {
            print(dbgmsg + "Letra W pressionada")
            self.W_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "W_selecionado"))
            criarNomeImagem(letra: "W")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.X_Button?.contains(point))! {
            print(dbgmsg + "Letra X pressionada")
            self.X_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "X_selecionado"))
            criarNomeImagem(letra: "X")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.Y_Button?.contains(point))! {
            print(dbgmsg + "Letra Y pressionada")
            self.Y_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Y_selecionado"))
            criarNomeImagem(letra: "Y")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.Z_Button?.contains(point))! {
            print(dbgmsg + "Letra Z pressionada")
            self.Z_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Z_selecionado"))
            criarNomeImagem(letra: "Z")
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres - 1
            
        }else if (self.RefazerButton?.contains(point))! {
            print(dbgmsg + "REFAZER pressionado")
            refazer(imagemExercicio: self.listaDeImagens[self.indiceAtual])
            
            
        }else if (self.VoltarLetraButton?.contains(point))! {
            removerUltimaLetra()
        }
        
        
        
        
        //Verificando se o usuario acertou ou nao a palavra
        if self.qtAtualDeCaracteres == 0 {
            verificarAcerto(imagem: self.listaDeImagens[self.indiceAtual])
        }
        
        
        
    }
    
    
    /*Esta funcao serve para retornar uma nova textura com base na imagem que lhe e passada*/
    func trocarTextura(imagem: UIImage) -> SKTexture{
        let texture: SKTexture = SKTexture(image: imagem)
        return texture
    }
    
    
    /*Este metodo reseta o trabalho em andamento ate o momento (ou quando o usuario erra
     a palavra). Ele serve para apagar a palavra descrita pelo usuario (fazer o label receber
     uma string vazia)  e tambem coloca os botoes das letras em seu estado atual*/
    func refazer(imagemExercicio: ImagemExercicio){
        
        self.NomeImagem?.text = ""
        self.nomeDaImagemASerFormada = ""
        self.qtAtualDeCaracteres =  getQtLetrasString(imagem: imagemExercicio)
        print(dbgmsg + "Refazendo...Qt. de caracteres do nome da imagem: \(self.qtAtualDeCaracteres)")
        
    }
    
    
    /*Esta funcao serve para incrementar a label com a letra clicada pelo usuario e verificar
     se a mesma esta ok*/
    func criarNomeImagem(letra: String) {
        self.nomeDaImagemASerFormada?.append(letra)
        self.NomeImagem?.text = self.nomeDaImagemASerFormada
    }
    
    
    /*Esta funcao serve para remover a ultima letra da palavra a ser formada*/
    func removerUltimaLetra(){
        if self.nomeDaImagemASerFormada?.count != 0{
            print(dbgmsg + "Removendo a ultima letra da palavra")
            let novoNomeDaImagem = String(describing: self.nomeDaImagemASerFormada!.dropLast())
            self.NomeImagem?.text = novoNomeDaImagem
            self.nomeDaImagemASerFormada = novoNomeDaImagem
            self.qtAtualDeCaracteres = self.qtAtualDeCaracteres + 1
        }
    }
    
    
    
    /*Esta funcao serve para trocar as texturas dos nodes que representam as letras para
     as texturas originais*/
    func colocarTexturasOriginaisLetras(){
        self.A_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "A"))
        self.B_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "B"))
        self.C_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "C"))
        self.D_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "D"))
        self.E_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "E"))
        self.F_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "F"))
        self.G_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "G"))
        self.H_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "H"))
        self.I_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "I"))
        self.J_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "J"))
        self.K_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "K"))
        self.L_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "L"))
        self.M_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "M"))
        self.N_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "N"))
        self.O_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "O"))
        self.P_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "P"))
        self.Q_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Q"))
        self.R_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "R"))
        self.S_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "S"))
        self.T_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "T"))
        self.U_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "U"))
        self.V_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "V"))
        self.W_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "W"))
        self.X_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "X"))
        self.Y_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Y"))
        self.Z_Button?.texture = trocarTextura(imagem: #imageLiteral(resourceName: "Z"))
        
    }
    
    
    
    //Mark: Funcao para carregar imagens no vetor de imagens e mostra - las na tela
    func carregarDiversasImagens(imagens: [ImagemExercicio],qtImagens: Int) {
        
        
        //Primeiramente embaralhando o vetor de imagens
        let imgsEmbaralhadas = imagens.shuffled()
        self.listaDeImagens = imgsEmbaralhadas
        
        
        //carregando a quantidade de letras que a primeira palavra a ser mostrada tem
        self.qtAtualDeCaracteres = getQtLetrasString(imagem: (self.listaDeImagens.first)!)
        
        print(dbgmsg + "Quantidade de imagens carregadas: \(self.listaDeImagens.count)")
        print(dbgmsg + "Quantidade de caracteres da 1a palavra: \(self.qtAtualDeCaracteres)")
        
        
    }
    
    
    //Esta funcao tem por objetivo retornar a quantidade de letras que uma string tem
    func getQtLetrasString(imagem: ImagemExercicio) -> Int {
        return (imagem.nome?.count)!
    }
    
    //Esta funcao serve para verificar se o usuario acertou ou errou o nome da imagem
    func verificarAcertoNaPalavra(imagem: ImagemExercicio) -> Bool {
        if(self.nomeDaImagemASerFormada.caseInsensitiveCompare(imagem.nome!) == ComparisonResult.orderedSame) {
            return true
        }else{
            return false
        }
        
    }
    
    
    
    /*Esta funcao serve para atualizar a textura da imagem que sera mostrada posteriormente
     caso o usuario acerte o nome da imagem*/
    func carregarProximaImagem(texture: SKTexture){
        
        self.Imagem?.texture = texture
        self.nomeDaImagemASerFormada = ""
        self.NomeImagem?.text = nomeDaImagemASerFormada
        
    }
    
    
    
    
    /*Este metodo tem por objetivo alertar o usuário sobre ele ter acertado ou errado
     o exercicio*/
    func alertarUsuario(mostrarMsgAcerto: Bool) {
        
        /*Alterando a aparencia do alerta*/
        let appearance = SCLAlertView.SCLAppearance(
            kWindowWidth: CGFloat(280), kWindowHeight: CGFloat(196), kTitleFont: UIFont(name: "HelveticaNeue", size: 24)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 21)!,
            
            
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 18)!,
            showCloseButton: false
        )
        
        self.alerta = SCLAlertView(appearance: appearance)
        
        if(mostrarMsgAcerto){ //configura o alerta exibir a mensagem de acerto junto com um botao para
            //carregar a proxima imagem
            
            self.alerta?.addButton("Ok", action: {
                print(self.dbgmsg + "[Alerta]Carregando a proxima imagem para mostrar para o usuario")
                self.carregarProximaImagem(texture: self.trocarTextura(imagem: self.listaDeImagens[self.indiceAtual].asset!)) //carrega a proxima imagem a ser mostrada assim
                //que o usuario aperta no ok na tela
                
                self.qtAtualDeCaracteres = self.getQtLetrasString(imagem: self.listaDeImagens[self.indiceAtual])
                
                
                
            })
            
            self.alerta?.showSuccess("Parabéns", subTitle: "Você acertou o nome da imagem \n")
            
        }else{
            self.alerta?.addButton("Ok", action: {
                print(self.dbgmsg + "[Alerta]Refazendo o mesmo exercicio.")
                self.refazer(imagemExercicio: self.listaDeImagens[self.indiceAtual])
                //caso o usuario erre o nome da imagem, ele simplesmente ira refazer o exercicio
                
            })
            
            self.alerta?.showError("Poxa!", subTitle: "Você errou o nome da imagem. Tente novamente!")
        }
        
        
    }
    
    
    
    /*A funcao abaixo server para verificar se a pessoa acertou o exercicio ou nao. Caso ela
     tenha acertado, carregue a proxima imagem. Caso ela tenha errado, refaca o exercicio*/
    func verificarAcerto(imagem: ImagemExercicio) {
        if verificarAcertoNaPalavra(imagem: imagem) {
            print(dbgmsg + "O usuario acertou o nome da imagem")
            self.indiceAtual = self.indiceAtual + 1
            alertarUsuario(mostrarMsgAcerto: true)
        }else {
            print(dbgmsg + "O usuario errou o nome da imagem")
            alertarUsuario(mostrarMsgAcerto: false)
        }
    }
    
    
}
