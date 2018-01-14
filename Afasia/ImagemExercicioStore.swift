//
//  ImagemExercicioStore.swift
//  Afasia
//
//  Created by Edson  Jr on 16/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//
// Classe de store de Imagens usadas nos exercicios



import Foundation
import UIKit



class ImagemExercicioStore {
    
    private static let dataImagemExercicio: [(      UIImage, //0 > asset da imagem
                                                    String, //1 > nome da imagem
                                                    String  //2 > letra inicial ou informacao de selecao
        )] = [

            //Palavras que iniciam com A
            (UIImage(named: "aviao")!,
             "Aviao",
             "A"
             ),
            
            (UIImage(named: "abacaxi")!,
             "Abacaxi",
             "A"
            ),
            
            (UIImage(named: "abacate")!,
             "Abacate",
             "A"
            ),
            
            
            //Palavras que iniciam com B
            (UIImage(named: "banana")!,
             "Banana",
             "B"
            ),
            
            (UIImage(named: "bule")!,
             "Bule",
             "B"
            ),
            
            (UIImage(named: "bola")!,
             "Bola",
             "B"
            ),
            
            
            
            //Palavras que iniciam com C
            (UIImage(named: "casa")!,
             "Casa",
             "C"
            ),
            
            (UIImage(named: "cachorro")!,
             "Cachorro",
             "C"
            ),
            
            (UIImage(named: "cavalo")!,
             "Cavalo",
             "C"
            )
            
            
            
            /*IMPLEMENTAR O RESTANTE DAS IMAGENS*/
        
             ] //fecha vetor de ImagemExercicio
    
    
    
    
    //Mark: Getters
    
    //Adquiri todas as imagens
    static func getAllImagensExecs() -> [ImagemExercicio] {
        
        var imagensExec = [ImagemExercicio]()
        
        for dataImagem in ImagemExercicioStore.dataImagemExercicio {
            let imagemExec = ImagemExercicio()
            
            imagemExec.asset = dataImagem.0
            imagemExec.nome = dataImagem.1
            imagemExec.infoSelecao = dataImagem.2
            
            imagensExec.append(imagemExec)
        }
        
        return imagensExec
    }

    
    
    
    
    //Adquiri todas as imagens com relacao a informacao de selecao (letra incial)
    static func getAllImagensExecs(incial: String) -> [ImagemExercicio] {
        
        var imagensExec = [ImagemExercicio]()
        
        for dataImagem in ImagemExercicioStore.dataImagemExercicio {
            let imagemExec = ImagemExercicio()
            
            if dataImagem.2 == incial {
                
                imagemExec.asset = dataImagem.0
                imagemExec.nome = dataImagem.1
                imagemExec.infoSelecao = dataImagem.2
                
                imagensExec.append(imagemExec)
                
            }
            
        }
        
        return imagensExec
    }

    
    
    
    
    

}
