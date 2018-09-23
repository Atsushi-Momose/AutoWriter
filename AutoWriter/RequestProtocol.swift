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

// URL https://stream.watsonplatform.net/speech-to-text/api
// ユーザー名　895c7ab9-da7e-4530-8b54-d8d0a7b6346d
// パス　ILtHrYCVzYgD

// Supplying the IAM API key
// let discovery = Discovery(version: "your-version-here", apiKey: "your-apikey-here")

// Supplying the accessToken
// let discovery = Discovery(version: "your-version-here", accessToken: "your-accessToken-here")


// Updating the accessToken
//    discovery.accessToken("new-accessToken-here")


// Username and Password
//let discovery = Discovery(username: "your-username-here", password: "your-password-here", version: "your-version-here")


// API Key
//    Note: This type of authentication only works with Visual Recognition, and for instances created before May 23, 2018. Newer instances of Visual Recognition use IAM.
//
//    let visualRecognition = VisualRecognition(apiKey: "your-apiKey-here", version: "your-version-here")


// Custom Service URLs
//    You can set a custom service URL by modifying the serviceURL property. A custom service URL may be required when running an instance in a particular region or connecting through a proxy.
//
//    For example, here is how to connect to a Tone Analyzer instance that is hosted in Germany:
//
//    let toneAnalyzer = ToneAnalyzer(
//    username: "your-username-here",
//    password: "your-password-here",
//    version: "yyyy-mm-dd"
//    )
//    toneAnalyzer.serviceURL = "https://gateway-fra.watsonplatform.net/tone-analyzer/api"


//Custom Headers
//There are different headers that can be sent to the Watson services. For example, Watson services log requests and their results for the purpose of improving the services, but you can include the X-Watson-Learning-Opt-Out header to opt out of this.
//
//We have exposed a defaultHeaders public property in each class to allow users to easily customize their headers:
//
//let naturalLanguageClassifier = NaturalLanguageClassifier(username: username, password: password)
//naturalLanguageClassifier.defaultHeaders = ["X-Watson-Learning-Opt-Out": "true"]
//Each service method also accepts an optional headers parameter which is a dictionary of request headers to be sent with the request.


//Synchronous Execution
//By default, the SDK executes all networking operations asynchronously. If your application requires synchronous execution, you can use a DispatchGroup. For example:
//
//let dispatchGroup = DispatchGroup()
//dispatchGroup.enter()
//assistant.message(workspaceID: workspaceID) { response in
//    print(response.output.text)
//    dispatchGroup.leave()
//}
//dispatchGroup.wait(timeout: .distantFuture)

