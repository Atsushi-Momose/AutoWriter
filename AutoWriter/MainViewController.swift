//
//  MainViewController.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.


import UIKit

class MainViewController: UIViewController {
    
    let presenter = MainViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getCurrencyInfo()
       
      
    }

}

