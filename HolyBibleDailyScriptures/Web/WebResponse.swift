//
//  WebResponse.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

// Class responsable for handle data and errors returned from API. This class is returned into an callback
final class WebResponse{
    
    var json : [String:Any]?
    var error : Error?
    var isError : Bool{
        return error != nil
    }
    var messageError : String{
        guard let error = error else { return "Error"}
        return error.localizedDescription
    }
    
    convenience init(json : [String:Any]?, error : Error?) {
        self.init()
        self.json = json
        self.error = error
    }
}
