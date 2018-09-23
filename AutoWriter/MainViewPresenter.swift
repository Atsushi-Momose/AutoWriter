//
//  MainViewPresenter.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.
//

import Foundation
import Alamofire

class MainViewPresenter {
    
    func getCurrencyInfo() {
        
        ConnectionService.shared.getCurrencyInfoList(success: {(result: Dictionary<String, AnyObject>) -> Void in
            
            
        }, failure: {(result: Error?) -> Void in
            
           
        })
    }
}
