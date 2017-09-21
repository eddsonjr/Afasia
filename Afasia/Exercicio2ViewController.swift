//
//  SelecaoReconhecimentoObjsCenaViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 12/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class Exercicio2ViewController: UIViewController {
    
    
    private var dbgmsg = "[EXEC2VC]: "
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    //Mark: Funcao para carregar as cenas do exercicio 2 de acordo com a opcao do usuario
    func carregarGameScene(cena: Int) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: "Exercicio2GameViewController") as! Exercicio2GameViewController
        
        newViewController.cenaAserCarregada = cena
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    
    
    //Mark: Button actions
    
    @IBAction func carregarExercicio2_1(_ sender: Any) {
        print(dbgmsg + "Carregando cena 1")
        carregarGameScene(cena: 1)
    }
    
    
    @IBAction func carregarExercicio2_2(_ sender: Any) {
        print(dbgmsg + "Carregando cena 2")
        carregarGameScene(cena: 2)
        
    }
    
    
    @IBAction func carregarExercicio2_3(_ sender: Any) {
        print(dbgmsg + "Carregando cena 3")
        carregarGameScene(cena: 3)
        
    }

}
