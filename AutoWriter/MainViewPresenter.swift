//
//  MainViewPresenter.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.
//

import Foundation
import Alamofire
import Speech

class MainViewPresenter: NSObject, SFSpeechRecognitionTaskDelegate {

    var isEnable = false
    var backGroundColor = UIColor.red
    var title = String()
    var state = UIControlState.disabled
    var text = String()
    
    // SFSpeechRecognizerインスタンス
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!
    // 音声認識のタスク
    private var recognitionTask: SFSpeechRecognitionTask?
    //認識リクエストのインスタンス
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    // マイク
    private let audioEngine = AVAudioEngine()
    
    override init() {
        super.init()
        speechRecognizer.delegate = self
    }
    
    func requestAuthorizationToSpeechRecognizer() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation { [weak self] in
                guard let `self` = self else { return }
                
                switch authStatus {
                case .authorized:   // 許可OK
                    self.isEnable = true
                    self.backGroundColor = UIColor.blue
                case .denied:       // 拒否
                    self.title = "録音許可なし"
                case .restricted:   // 限定
                    self.title = "このデバイスでは無効"
                case .notDetermined:// 不明
                    self.title = "録音機能が無効"
                }
            }
        }
    }
    
    func getCurrencyInfo() {
        ConnectionService.shared.fetchCurrencyInfoList(success: {(result: Dictionary<String, AnyObject>) -> Void in
            
        }, failure: {(result: Error?) -> Void in
            
        })
    }
}

extension MainViewPresenter : SFSpeechRecognizerDelegate {
    // 音声認識の可否が変更したときに呼ばれるdelegate
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        
        if available {
            // 利用可能になったら、録音ボタンを有効にする
            isEnable = true
            title = "Start Recording"
            state = .normal
            backGroundColor = UIColor.blue
        } else {
            // 利用できないなら、録音ボタンは無効にする
            isEnable = false
            title = "現在、使用不可"
            state = .disabled
        }
    }
}

