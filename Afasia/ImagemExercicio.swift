//
//  ImagemExercicio.swift
//  Afasia
//
//  Created by Edson  Jr on 16/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//
//  Esta classe representa os dados relevantes referentes as imagens que serao
//  mostradas nos exercicios. Sera responsavel nao somente por armazenar a imagem
//  em si, mas tambem seu nome, se ela e nasal ou nao, entre outras informacoes
//  relevantes na construcao de cada exercicio que compoe o aplicativo


import Foundation
import UIKit


class ImagemExercicio{
    
    var asset: UIImage? = nil //Imagem em si
    var nome: String? = nil  //nome da imagem
    var infoSelecao: String? = nil //letra inicial da imagem ou alguma informacao relevante para selecao da imagem
                                //(exemplo: palavras que comecam com "A", palavras que contenham "nh", etc)
    
    
}
