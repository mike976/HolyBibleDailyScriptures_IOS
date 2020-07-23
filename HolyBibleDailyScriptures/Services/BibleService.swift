//
//  BibleService.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

protocol BibleServiceProtocol {
    
    /*
     getVerse from New Testament for random book, chapter and 2 verses
     getVerse from Proverb - from book of Proverbs, for random chapter and 2 verses
     getVerse from Psalms - from book of Psalms, for random chapter and 2 verses
     */
    
    typealias getVerse<Verse> = (Verse, WebResponse) -> Void
    func getVerse(_ bookName: String, _ chapter: Int, _ startingVerse: Int, onComplete: @escaping getVerse<Verse>)
}

class BibleService : BibleServiceProtocol {
    
    private var webClient: WebClientProtocol!
    
    required init(webClient: WebClientProtocol) {
        
        self.webClient = webClient
    }
    
    func getVerse(_ bookName: String, _ chapter: Int, _ startingVerse: Int, onComplete: @escaping getVerse<Verse>) {
        
          //https://bible-api.com/romans+12:1-2
          //https://bible-api.com/proverbs+1:1-2?translation=kjv

        
        webClient.request(url: URL(string: "https://bible-api.com/\(bookName)+\(chapter):\(startingVerse)?translation=kjv")) { (webResponse) in
            onComplete(Verse(json: webResponse.json) as Verse, webResponse)
        }
    }

}



