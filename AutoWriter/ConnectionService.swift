//
//  ConnectionService.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class ConnectionService {
    
    static var shared = ConnectionService()
    private init() {}
    
    func getCurrencyInfoList(success: @escaping (Dictionary<String, AnyObject>) -> Void, failure: @escaping (Error?) -> Void) {
//            let baseUrl = request.baseUrl
//            let path = request.pat
//            let requestUrl = baseUrl + path
//            let method = request.method
//            let encoding = request.encoding
//            let parameters = request.parameters
//            let headers = request.headers
        // @"https://hiring.coiney.com/exchange _rates"
        //"http://www.gaitameonline.com/rateaj/getrate"
        Alamofire.request("https://hiring.coiney.com/exchange_rates", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:])
            
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    do {
                        guard let data = response.data else { return }
                        
                        // パースする
                        if let items = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, AnyObject> {
                            success(items)
                        }
                    }
                    catch {
                            print("suceess catch")
                        failure(response.error)
                        }
                case .failure(_):
                    print("failure")
                    failure(response.error!)
                }
        }
    }
}


