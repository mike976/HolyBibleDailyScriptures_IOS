//
//  WebApi.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

protocol WebClientProtocol {
        
    typealias requestOnComplete = (WebResponse) -> Void
    func request(url : URL?, onComplete : @escaping requestOnComplete)
}


class WebClient : WebClientProtocol {
    
    deinit {
           print("OS reclaiming memory - WebClient - no retain cycle/memory leaks here")
    }
    
    typealias requestOnComplete = (WebResponse) -> Void
    func request(url : URL?, onComplete : @escaping requestOnComplete){
        
        guard let url = url else { return }
        //print("-----------\n\nRequest URL: \(url)\n\n-----------")
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error{
                print("Error = \(error)")
            }
            
            guard let data = data else{
                print("Empty data")
                onComplete(WebResponse(json: nil, error: error))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            //print(json ?? "Cant parse JSON")
            
            onComplete(WebResponse(json: json, error: error))
            //print(json ?? "Cant parse JSON")
        }
        
        task.resume()
    }
}


