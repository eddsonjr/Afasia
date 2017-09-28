//
//  ViewController.swift
//  Afasia
//
//  Created by Edson  Jr on 15/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import UIKit

class SelecaoJogosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func carregarExercicio3BTN(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Exercicio3") as! Exercicio3GameViewController
        
        //chamando controladora
        self.present(controller, animated: true, completion: nil)

    }
    
    
}

