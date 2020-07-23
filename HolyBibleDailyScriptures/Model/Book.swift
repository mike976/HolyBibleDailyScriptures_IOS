//
//  Book.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 22/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

class Book {
    
    var name: String
    var chapters: [[Int:Int]]
    
    init(_ name: String, _ chapters: [[Int:Int]]) {
        self.name = name
        self.chapters = chapters
    }
}
