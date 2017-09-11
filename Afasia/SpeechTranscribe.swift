//
//  SpeechTranscribe.swift
//  Afasia
//
//  Created by Edson  Jr on 11/09/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import Speech



class SpeechTranscribe: NSObject, SFSpeechRecognizerDelegate {
    
    private let dbgmsg = "[SpeechTranscribe]:"
    private let speechRecognizer: SFSpeechRecognizer?
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()

    
    
    
    init(speechLocaleIdentifier: Locale) {
        self.speechRecognizer = SFSpeechRecognizer(locale: speechLocaleIdentifier)
        //speechRecognizer?.delegate = self
    }
    
    
    
    
    
    //solicitando autorizacao para trabalhar com o microfone e realizar a transcricao
    func requestSpeechAuth() -> Bool {
        
        var authorized: Bool = false
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
        switch authStatus {
            case .authorized:
                print(self.dbgmsg + "Acesso ao microfone autorizado!")
                authorized = true
            case .denied:
                print(self.dbgmsg + "Acesso ao microfone negado!")
            case .restricted:
                print(self.dbgmsg + "O dispositivo nao possui acesso a microfone!")
            case .notDetermined:
                print(self.dbgmsg + "Nao foi possivel determinar o uso do microfone")
            default:
                    print(self.dbgmsg + "[DEFAULT]: Nao foi possivel determinar o uso do microfone")
                
            }
            
        }
        
        return authorized
     
    }
    
    //Funcao para reconhecimento e trnascricao de audio para texto
    func startRecording() -> String {
        
        var textoTranscrito: String?
        
            
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            print(self.dbgmsg + "audioSession properties weren't set because of an error.")
        }
            
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
        guard let inputNode = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }
            
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
            
        recognitionRequest.shouldReportPartialResults = true
            
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
                
        var isFinal = false
                
            if result != nil {
                    
                textoTranscrito = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
                
                if error != nil || isFinal {
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    
                    self.recognitionRequest = nil
                    self.recognitionTask = nil
                    
                }
            })
            
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                self.recognitionRequest?.append(buffer)
            }
            
            audioEngine.prepare()
            
            do {
                try audioEngine.start()
            } catch {
                print("audioEngine couldn't start because of an error.")
            }
            
        
        
            return textoTranscrito!
        }
}
    
    
    
    
    
    

