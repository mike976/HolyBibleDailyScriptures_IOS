//
//  Verse.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

class Verse {
     
    var Reference: String? = ""
    var Text: String? = ""
    var TranslationName: String? = ""
    
    init(json: [String: Any]?) {
        if let safeJson = json {
            self.Reference = safeJson["reference"] as? String ?? ""
            self.Text = safeJson["text"] as? String ?? ""
            self.TranslationName = safeJson["translation_name"] as? String ?? ""
        }
    }
}
