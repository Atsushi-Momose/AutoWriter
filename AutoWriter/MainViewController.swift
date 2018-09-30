//
//  MainViewController.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.


import UIKit
import GradientCircularProgress

class MainViewController: UIViewController {
    
    @IBOutlet weak var MaintextView: UITextView!
    @IBOutlet weak var recordButton: UIButton!
    
    let presenter = MainViewPresenter()
    let progress = GradientCircularProgress()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressView = progress.show(frame: self.view.frame, message: "Loading...", style: ProgressStyle())
        view.addSubview(progressView!)
        
        recordButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.requestAuthorizationToSpeechRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func changeRecordButton() {
        recordButton.isEnabled = presenter.isEnable
        recordButton.setTitle(presenter.title, for: presenter.isEnable ? .selected : .disabled)
        recordButton.backgroundColor = presenter.backGroundColor
    }
    
    
    @IBAction func recordAction(_ sender: Any) {
    
    }
}

