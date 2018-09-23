//
//  RequestProtocol.swift
//  AutoWriter
//
//  Created by mmsc on 2018/09/23.
//  Copyright © 2018年 mmsc. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    var parameters: Alamofire.Parameters? { get }
    var headers: Alamofire.HTTPHeaders? { get }
}

extension RequestProtocol {
    var baseUrl: String {
        return ""
    }
    var encoding: Alamofire.ParameterEncoding {
        return JSONEncoding.default
    }
    var parameters: Alamofire.Parameters? {
        return nil
    }
    var headers: Alamofire.HTTPHeaders? {
        return nil
    }
}

