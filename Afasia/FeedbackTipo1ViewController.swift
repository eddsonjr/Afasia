//
//  FeedbackTipo1ViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 21/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class FeedbackTipo1ViewController: UIViewController {

    //Mark: Variaveis que serao computadas quando a tela for chamada via storyboard id
    var acertos: Int = 0
    var erros: Int = 0
    var duvidas: Int = 0
    
    
    //Mark: mensagem de debug
    var dbmsg = "[FEEDABACK1]: "
    
    
    //Mark: outlets
    @IBOutlet weak var labelAcertos: UILabel!
    @IBOutlet weak var labelErros: UILabel!
    @IBOutlet weak var labelDuvidas: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dbmsg + "acertos: \(acertos) | erros: \(erros) | duvidas: \(duvidas)")

        
        //monstrando na tela a quantidade de erros, acertos e duvidas
        
        self.labelAcertos.text = String(self.acertos)
        self.labelErros.text = String(self.erros)
        self.labelDuvidas.text = String(self.duvidas)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Mark: Button actions
    
    @IBAction func fecharFeedback(_ sender: Any) {
    }
    
}
