//
//  TrocaDeCenasHelper.swift
//  Afasia
//
//  Created by Edson  Jr on 14/02/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

class TrocaDeCenasHelper {
    
    
    
    //Este alerta serve para caso o usuario queira sair do exercicio e ele esteja em curso
    static func alertaSairExercicioEmCurso(completionHandler:@escaping ()->()){
        var alerta: SCLAlertView = SCLAlertView()
        
        alerta.alertaMensagemSimplesWarning(titulo: "Sair do Exercicio?", mensagemAlerta: "Você deseja realmente sair deste exercício", textoBotao: "Sair", completionHandler: completionHandler)
        
    }
    

    
    
    
}
