//
//  ReconhecimentoPalavrasViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 16/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class ReconhecimentoPalavrasViewController: UIViewController {

    
    //Mark: View compoenntes
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet var configuracoesPopOver: UIView!
    @IBOutlet weak var configuracoesPopOverPicker: UIPickerView!
    
    
    //Mark: Configuracoes do picker
    var configExecPickerData: [String] = ["Todas","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","Y","Z"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    //Mark: Button Actions
    
    //resposnavel por chamar o pop over das configuracoes do 
    @IBAction func configuracoes(_ sender: Any) {
        
        
    }
    
    
    //responsavel por voltar para a tela anterior
    @IBAction func voltarParaTelaAnterior(_ sender: Any) {
        
    }
    
    
    //responsavel por computar acertos
    @IBAction func acertou(_ sender: Any) {
        
        
    }
    
    
    //responsavel por computar as duvidas
    @IBAction func duvida(_ sender: Any) {
        
    }
    
    
    //responsavel por computar os erros
    @IBAction func errou(_ sender: Any) {
        
        
    }
    
 
}
