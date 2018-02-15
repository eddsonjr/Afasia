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
    
    
    //Chama tela de feedback do tipo 1 (tela de feedback com informacao de duvidas)
    static func chamarFeedbackTipo1(acertos: Int, erros: Int, duvidas: Int, viewController: UIViewController){
        
        let controller = FeedbackTipo1ViewController.instantiateFromStoryboard()

        //carregando variaveis
        controller.acertos = acertos
        controller.erros = erros
        controller.duvidas = duvidas
  
        viewController.present(controller, animated: true, completion: nil)

    }
    
    
    //chama  a tela principal de selecao de exercicios
    static func chamarTelaPrincipalDeSelecaoExercicios(viewController: UIViewController){
        let controller = SelecaoJogosViewController.instantiateFromStoryboard()
        viewController.present(controller, animated: true, completion: nil)
    }
    
    
    
    
    //chama a tela de feedback tipo 2
    static func chamarFeedbackTipo2(acertos: Int, erros: Int, viewController: UIViewController){
        let controller = FeedbackTipo1ViewController.instantiateFromStoryboard()
        
        //carregando variaveis
        controller.acertos = acertos
        controller.erros = erros
        
         viewController.present(controller, animated: true, completion: nil)
        
    }
    
    
    
    
}
