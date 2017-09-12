//
//  SelecaoReconhecimentoObjsCenaViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 12/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class SelecaoReconhecimentoObjsCenaViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    
    //Mark: Funcao para carregar as cenas do exercicio 2 de acordo com a opcao do usuario
    func carregarGameScene() {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    
    
    //Mark: Button actions
    
    @IBAction func carregarExercicio2_1(_ sender: Any) {
        
        carregarGameScene()
    }

}
