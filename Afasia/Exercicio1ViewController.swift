//
//  ReconhecimentoPalavrasViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 16/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class Exercicio1ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    //Mark: View componentes
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet var configuracoesPopOver: UIView!
    @IBOutlet weak var configuracoesPopOverPicker: UIPickerView!
    @IBOutlet weak var swipeView: UIView!
    
    @IBOutlet weak var errouBTN: UIButton!
    @IBOutlet weak var acertouBTN: UIButton!
    @IBOutlet weak var statusDaImagem: UILabel!
    
    
    //Mark: Mensagem de debug
    private let dbgmsg = "[EXEC1]: "
    
    
    //Mark: Configuracoes do picker
    var configExecPickerData: [String] = ["Diversas  palavras","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","Y","Z"]
    
    
    
    
    //Mark: enum para indicar quais os estados possiveis a serem computados no exercicio (acerto, erro, duvida)
    enum estadosDoExercicio1: String {
        case acertou = "acertou"
        case erro = "errou"
        case duvida = "duvida"
    }
    
    
    //Mark: Struct para armazenar se a pessoa acertou, errou ou esta em duvida naquela figura em si
    struct acertoErroDuvidaStruct {
        
        var imagemExec: ImagemExercicio?
        var estado: String?
        
    }
    
    
    
    //Mark: variaveis para computar a quantidade de acertos, erros ou duvidas e controlar o indice de acesso
    var acertos: Int = 0
    var erros: Int = 0
    var duvidas: Int = 0
    
    var estruturaDeAcertosErrosDuvidas: [acertoErroDuvidaStruct]?
    
    var idImagemAtual: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        //adicionando o suporte ao swipe para passar as imagens
        addSwipe()
        //delegate e datasource do UIPickerView
        self.configuracoesPopOverPicker.delegate = self
        self.configuracoesPopOverPicker.dataSource = self
        
        
        //Carregando todas as imagens no vetor de imagens
        carregarDiversasImagens(imagens: ImagemExercicioStore.getAllImagensExecs(), qtImagens: 4)
        
        
        
        //Sumindo com a Navigation
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //Sumindo com tabbar
        self.tabBarController?.tabBar.isHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    
    //Mark: Button Actions
    
    //resposnavel por chamar o pop over das configuracoes do 
    @IBAction func configuracoes(_ sender: Any) {
        print(dbgmsg + "Chamando configuracoes")
        callPopover()
    }
    
    
    //responsavel por voltar para a tela anterior
    @IBAction func voltarParaTelaAnterior(_ sender: Any) {
        AlertaHelper.alertaSairExercicioEmCurso {
            TrocarTelaHelper.chamarTelaPrincipalDeSelecaoExercicios(viewController: self)
        }
    }
    
    
    
    
    //responsavel por computar acertos
    @IBAction func acertou(_ sender: Any) {
        print(dbgmsg + "Acertou!")
        self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado = estadosDoExercicio1.acertou.rawValue
        
        
        //computando acerto
        self.acertos = acertos + 1
        self.duvidas = duvidas - 1
        
        
         //carrega a proxima imagem se possivel
         carregarProximaImagem()
        
        //verificando se ainda restam imagens que nao foram computadas
        if verificarSeTodasImagensForamRespondidas() {
            print(dbgmsg + "Todas imagens ja foram computadas. Va para a tela de feedback")
            alertarConclusaoExercicio()
        }
        
    
    }
    
    
    
    
    //responsavel por computar os erros
    @IBAction func errou(_ sender: Any) {
        print(dbgmsg + "Errou!")
        self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado = estadosDoExercicio1.erro.rawValue
       
        
        //computando erros
        self.erros = erros + 1
        self.duvidas = duvidas - 1
        
        
        //carrega a proxima imagem se possivel
        carregarProximaImagem()
        
        //verificando se ainda restam imagens que nao foram computadas
        if verificarSeTodasImagensForamRespondidas() {
            print(dbgmsg + "Todas imagens ja foram computadas. Va para a tela de feedback")
            alertarConclusaoExercicio()
        }


    
    }
    
    
    
    //responsavel por fechar as configuracoes
    @IBAction func fecharConfiguracoes(_ sender: Any) {
        print(dbgmsg + "Fechando configuracoes")
        removePopover()
        
    }
    
    
    
    
    //responsavel por finalizar o exercicio
    @IBAction func finalizar(_ sender: Any) {
     
        //carregar a tela de feedback de erros e acertos aqui
        print(dbgmsg + "acertos: \(acertos) | erros: \(erros) | duvidas: \(duvidas)")
       
        AlertaHelper.alertaSairExercicioEmCurso {
            TrocarTelaHelper.chamarFeedbackTipo1(acertos: self.acertos, erros: self.erros, duvidas: self.duvidas, viewController: self)
        }
        
        
        
        
       
        
        
    }
    
    
    //Mark: Funcoes de swipe 
    
    //adicionando suporte ao swipe na swipeView
    func addSwipe() {
        let swipeGestures: [UISwipeGestureRecognizerDirection] = [UISwipeGestureRecognizerDirection.right,UISwipeGestureRecognizerDirection.left]
        for direction in swipeGestures {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(Exercicio1ViewController.handleSwipeGesture(_sender:)))
            gesture.direction = direction
            self.swipeView.addGestureRecognizer(gesture)
        }
        
    }

    
    
    
    //implementando comportamento de troca das imagens
    func handleSwipeGesture(_sender: UISwipeGestureRecognizer){
        
        
        if _sender.direction == UISwipeGestureRecognizerDirection.left {
            print(dbgmsg + "Swipe action: esquerda") //avanca as imagens
            self.idImagemAtual = self.idImagemAtual! + 1
            if idImagemAtual! < (self.estruturaDeAcertosErrosDuvidas?.count)! {
                //animacoes de troca ocorrem aqui
                self.ImageView.image = self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].imagemExec?.asset
                
                //se o estado da imagem do exercicio atual for igual ao de duvida, apresente os botoes
                if self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado != estadosDoExercicio1.duvida.rawValue {
                    print(dbgmsg + "Acertou ou errou esta imagem")
                    self.errouBTN.isHidden = true
                    self.acertouBTN.isHidden = true
                    self.statusDaImagem.text = self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado
                }else{
                    self.errouBTN.isHidden = false
                    self.acertouBTN.isHidden = false
                    self.statusDaImagem.text = "  "
                }
                
            }else{
                self.idImagemAtual = ((self.estruturaDeAcertosErrosDuvidas?.count)! - 1)
                print(dbgmsg + "Limite maximo de imagens alcancado!")
            }
            
        }else if _sender.direction == UISwipeGestureRecognizerDirection.right {
            print(dbgmsg + "Swipe action: direita") //volta as imagens
            self.idImagemAtual = self.idImagemAtual! - 1
            if idImagemAtual! >= 0 {
                //animacoes de troca podem ocorrer aqui
                self.ImageView.image = self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].imagemExec?.asset
                
                
                //se o estado da imagem do exercicio atual for igual ao de duvida, apresente os botoes
                if self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado != estadosDoExercicio1.duvida.rawValue {
                    print(dbgmsg + "Acertou ou errou esta imagem")
                    self.errouBTN.isHidden = true
                    self.acertouBTN.isHidden = true
                    self.statusDaImagem.text = self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].estado
                }else{
                    self.errouBTN.isHidden = false
                    self.acertouBTN.isHidden = false
                    self.statusDaImagem.text = "  "
                }


                
                
            }else {
                self.idImagemAtual = 0
                print(dbgmsg + "Limite minimo de imagens alcancado!")
            }
            
        }
        
    }
    
    
    
    
    
    
    //Mark: Funcoes de animacao para chamar e retirar o popover
    //funcao para chamar o popover
    func callPopover() {
        self.view.addSubview(self.configuracoesPopOver)
        self.configuracoesPopOver.center = self.view.center
        
        
        self.configuracoesPopOver.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.4, animations: {
            self.configuracoesPopOver.alpha = 1.0
            self.configuracoesPopOver.transform = CGAffineTransform.identity
        })
        
    }
    
    
    //funcao para remover o popover
    func removePopover() {
        UIView.animate(withDuration: 0.4, animations: {
            self.configuracoesPopOver.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
            self.configuracoesPopOver.alpha = 0
        }, completion: {(sucess: Bool) in
            self.configuracoesPopOver.removeFromSuperview()
        })
    }

    
    
    
    
    
    
    
    
    //Mark: Funcoes de delegate do pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.configExecPickerData.count
    }

 
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.configExecPickerData[row]
    }

    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        let opcaoSelecionada = self.configExecPickerData[row]
        print(dbgmsg + "Configuracoes do exercicio 1. Selecionada opcao [\(opcaoSelecionada)]")
        
        
        /*Falta implementar para carregar todas as imagens*/
        carregarImagens(imagens: ImagemExercicioStore.getAllImagensExecs(incial: opcaoSelecionada))
        
        if opcaoSelecionada == "Diversas  palavras" {
            print(dbgmsg + "Carregando diversas palavras")
            carregarDiversasImagens(imagens: ImagemExercicioStore.getAllImagensExecs(), qtImagens: 4)
        }
        
    }
    
    
    
    //Mark: Funcao  para carregar as imagens de acordo com o nome dado
    func carregarImagens(imagens: [ImagemExercicio]) {
        
        self.estruturaDeAcertosErrosDuvidas = []
        self.duvidas = 0
        
        for imagem in imagens {
            
            self.estruturaDeAcertosErrosDuvidas?.append(acertoErroDuvidaStruct.init(imagemExec: imagem, estado: estadosDoExercicio1.duvida.rawValue))
            self.duvidas = duvidas + 1
 
        }
            
        
        self.ImageView.image = self.estruturaDeAcertosErrosDuvidas?.first?.imagemExec?.asset
        self.idImagemAtual = 0

         print(dbgmsg + "Estrutura de acertos,erros,duvidas com: \(String(describing: self.estruturaDeAcertosErrosDuvidas?.count)) elementos. Indice da imagem em: \(String(describing: self.idImagemAtual))")
        
    }
 
    
    
    //Mark: Funcao para carregar imagens no vetor de imagens e mostra - las na tela
    func carregarDiversasImagens(imagens: [ImagemExercicio],qtImagens: Int) {
      
    
        self.estruturaDeAcertosErrosDuvidas = []
        self.duvidas = 0
        
        //Primeiramente embaralhando o vetor de imagens
        let imgsEmbaralhadas = imagens.shuffled()
        
        
        for i in 0 ... qtImagens-1{
            self.estruturaDeAcertosErrosDuvidas?.append(acertoErroDuvidaStruct.init(imagemExec: imgsEmbaralhadas[i], estado: estadosDoExercicio1.duvida.rawValue))
            self.duvidas = duvidas + 1

        }
        self.ImageView.image = self.estruturaDeAcertosErrosDuvidas?.first?.imagemExec?.asset
        self.idImagemAtual = 0

    
        
        
         print(dbgmsg + "Estrutura de acertos,erros,duvidas com: \(String(describing: self.estruturaDeAcertosErrosDuvidas?.count)) elementos. Indice da imagem em: \(String(describing: self.idImagemAtual))")
        
    }
    
    
    //Mark: funcao para verificar se todas as imagens ja foram tidas como corretas ou erradas
    func verificarSeTodasImagensForamRespondidas() -> Bool{
        
        if self.duvidas == 0 {
            return true
        }else {
            return false
        }
    }
    

    
    //Mark: Criar alerta para informar que todas as imagens foram respondidas e que o exercicio terminou
    func alertarConclusaoExercicio() {
        AlertaHelper.alertarConclusaoExercicio {
            TrocarTelaHelper.chamarFeedbackTipo1(acertos: self.acertos, erros: self.erros, duvidas: self.duvidas, viewController: self)
        }
    }

    
    //Mark: Funcao para passar as imagens de forma automatica
    func carregarProximaImagem() {
        print(dbgmsg + "Index anterior: \(self.idImagemAtual)")
        self.idImagemAtual = self.idImagemAtual! + 1
        if idImagemAtual! < (self.estruturaDeAcertosErrosDuvidas?.count)!{
             self.ImageView.image = self.estruturaDeAcertosErrosDuvidas?[idImagemAtual!].imagemExec?.asset
        }
        
    }
    

}
