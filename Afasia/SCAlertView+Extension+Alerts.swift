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
    
    
    //Mark: Funcoes do tipo warning
    
    
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
    
    
    //Alerta do tipo warning com botao de cancelar
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
    
    
    
    
    
    
    //Mark: Funcoes do tipo sucess
    
    
    //mensagem simples do tipo sucesso
    func alertaMensagemSimplesSucesso(titulo: String,mensagemAlerta: String,textoBotao: String){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            
        }
        
        alert.showSuccess(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0x17D472, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
    }
    
    
    
    
    //mensagem simples do tipo sucess com completionHandler
    func alertaMensagemSimplesSucesso(titulo: String,mensagemAlerta: String,textoBotao: String,completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
            
        }
        
        alert.showSuccess(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0x17D472, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
    }
    
    
    
    //mensagem com botao de cancelar
    func alertaMensagemSucessoComBotaoCancelar(titulo: String,mensagemAlerta: String,textoBotao: String,completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
            
        }
        
        alert.showSuccess(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0x17D472, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
        
    }
    
    
    
    
    
    
    
    //Mark: Funcoes do tipo error/failure
    
    
    
    //mensagem simples do tipo falha
    func alertaMensagemSimplesFalha(titulo: String,mensagemAlerta: String,textoBotao: String){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            
        }
        
        alert.showError(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xDA3636, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
    }
    
    
    
    
    //mensagem simples de falha com completionHandler
    func alertaMensagemSimplesFalha(titulo: String,mensagemAlerta: String,textoBotao: String,completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
            
        }
        
        alert.showError(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle:  0xDA3636, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
    }
    
    
    
    
    //mensagem com botao de cancelar
    func alertaMensagemFalhaComBotaoCancelar(titulo: String,mensagemAlerta: String,textoBotao: String,completionHandler: @escaping ()->()){
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true
        )
        let alert = SCLAlertView(appearance: appearance)
        
        alert.addButton(textoBotao) {
            completionHandler()
            
        }
        
        alert.showError(titulo, subTitle: mensagemAlerta, closeButtonTitle: "Cancelar", timeout: nil, colorStyle: 0xDA3636, colorTextButton: 0xFFFFFF, animationStyle: .topToBottom)
        
        
    }

    
}
