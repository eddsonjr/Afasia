//
//  FeedbackTipo2ViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 14/02/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import UIKit

class FeedbackTipo2ViewController: UIViewController {
    
    
    //Mark: Variaveis que serao computadas quando a tela for chamada via storyboard id
    var acertos: Int = 0
    var erros: Int = 0
    
    
    //Mark: mensagem de debug
    var dbmsg = "[FEEDABACK1]: "

    @IBOutlet weak var acertosLabel: UILabel!
    @IBOutlet weak var errosLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dbmsg + "acertos: \(acertos) | erros: \(erros)")

        //monstrando na tela a quantidade de erros, acertos e duvidas
        self.acertosLabel.text = String(self.acertos)
        self.errosLabel.text = String(self.erros)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    @IBAction func fecharFeedback(_ sender: Any) {
        TrocarTelaHelper.chamarTelaPrincipalDeSelecaoExercicios(viewController: self)
    }
    
}
