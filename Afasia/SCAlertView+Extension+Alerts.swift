//
//  SCAlertView+Extension+Alerts.swift
//  Afasia
//
//  Created by Edson  Jr on 23/01/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit


extension SCLAlertView {
    
    
    
    //Alerta do tipo warning simples
    func alertaMensagemSimplesWarning(titulo: String,mensagemAlerta: String,textoBotao: String){
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        
        alert.addButton(textoBotao) {
            
        }
    
       alert.showWarning(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xFED035, colorTextButton: 0x262626, animationStyle: .topToBottom)
    
    }
    
    
    
    
    //Alerta do tipo warning contendo um completion handler
    func alertaMensagemSimplesWarning(titulo: String, mensagemAlerta: String,textoBotao: String, completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
        
        }
        
        alert.showWarning(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xFED035, colorTextButton: 0x262626, animationStyle: .topToBottom)

    }
    
    
    
    func alertaMensagemWarningComBotaoCancelar(titulo: String, mensagemAlerta: String,textoBotao: String, completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true
        )
        
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
            
        }
        
        alert.showWarning(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xFED035, colorTextButton: 0x262626, animationStyle: .topToBottom)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
