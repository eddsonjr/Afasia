//
//  MySpriteKitDelegate.swift
//  Afasia
//
//  Created by Edson  Jr on 21/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//
//  Este delegate e responsavel por permitir a saida do spritekit para o 
//  UIKIT e devera ser colocado em qualquer gameviewcontroller (ela conformar com
//  ele) para permitir que o usuario consiga retornar para o aplicativo.
//
//

import Foundation


protocol MySpriteKitDelegate {
    
    func carregarFeedback()
    func carregarTelaDeSelecaoDeExercicio()
}
