//
//  TrocaDeCenasHelper.swift
//  Afasia
//
//  Created by Edson  Jr on 14/02/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

class AlertaHelper {
    
    
    //Este alerta serve para caso o usuario queira sair do exercicio e ele esteja em curso
    static func alertaSairExercicioEmCurso(completionHandler:@escaping ()->()){
        let alerta: SCLAlertView = SCLAlertView()
        
        alerta.alertaMensagemSimplesWarning(titulo: "Sair do Exercicio?", mensagemAlerta: "Você deseja realmente sair deste exercício", textoBotao: "Sair", completionHandler: completionHandler)
    }
    
    
    
    

    //Este alerta serve para caso o usuario tenha completado o exercicio com sucesso
    static func alertarConclusaoExercicio(completionHandler:@escaping ()->()){
        let alerta: SCLAlertView = SCLAlertView()
        
        alerta.alertaMensagemSimplesSucesso(titulo: "Exercício Concluído", mensagemAlerta: "Você completou este exercício. Veja seus resultados!", textoBotao: "Ok", completionHandler: completionHandler)
    }
    

    
    
    
}
