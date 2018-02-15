//
//  TrocarTelaHelper.swift
//  Afasia
//
//  Created by Edson  Jr on 14/02/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit


class TrocarTelaHelper {
    
    
    static func chamarFeedbackTipo1(acertos: Int, erros: Int, duvidas: Int, viewController: UIViewController){
        
        let controller = FeedbackTipo1ViewController.instantiateFromStoryboard()

        //carregando variaveis
        controller.acertos = acertos
        controller.erros = erros
        controller.duvidas = duvidas
  
        viewController.present(controller, animated: true, completion: nil)

    }
    
    
    
    
    static func chamarTelaPrincipalDeSelecaoExercicios(viewController: UIViewController){
        let controller = SelecaoJogosViewController.instantiateFromStoryboard()
        viewController.present(controller, animated: true, completion: nil)
    }
    
    
    
    
    
}
