//
//  BibleViewModel.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import Foundation

protocol BibleViewModelProtocol {
    func getNewTestamentVerse() -> Verse?
    func getPsalmVerse() -> Verse?
    func getProverbVerse() -> Verse? 
}

class BibleViewModel : BibleViewModelProtocol {
    
    private var _bible: Bible
    
    deinit {
        print("OS reclaiming memory - BibleViewModel - no retain cycle/memory leaks here")
    }
    
    private var bibleService: BibleServiceProtocol!
    
    required init(bibleService: BibleServiceProtocol) {
        
        self.bibleService = bibleService
        self._bible = Bible()
    }
    
    
    func getNewTestamentVerse() -> Verse? {
        
        var verse: Verse? = nil
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatchQueue = DispatchQueue.global(qos: .background)
        
        dispatchQueue.async {
            
            let book: Book = self._bible.books[Int.random(in: 1...self._bible.books.count)-1]
            let bookName = book.name
            
            let chapters = book.chapters
            let chapter = chapters[Int.random(in: 1...chapters.count)-1]
            
            let chapterNo = chapter.keys.first!
            let verseNo = Int.random(in: 1...chapter.values.first!)
            
            verse = self.getVerseAsync(bookName, chapterNo, verseNo)
            
            semaphore.signal()
            
        }
        
        let timeoutInSecs = Double(5)
        _ = semaphore.wait(timeout: .now() + timeoutInSecs)
        
        return verse
    }
    
    func getPsalmVerse() -> Verse? {
        
        var verse: Verse? = nil
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatchQueue = DispatchQueue.global(qos: .background)
        
        dispatchQueue.async {
            
            let psalm = self._bible.psalms[Int.random(in: 1...self._bible.psalms.count)-1]
            let chapterNo = psalm.keys.first!
            let verseNo = Int.random(in: 1...psalm.values.first!)
        
            verse = self.getVerseAsync("psalms", chapterNo, verseNo)
            
            semaphore.signal()
            
        }
        
        let timeoutInSecs = Double(5)
        _ = semaphore.wait(timeout: .now() + timeoutInSecs)
        
        return verse
    }
    
    
    func getProverbVerse() -> Verse? {
        
        var verse: Verse? = nil
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatchQueue = DispatchQueue.global(qos: .background)
        
        dispatchQueue.async {
            
            let proverb = self._bible.proverbs[Int.random(in: 1...self._bible.proverbs.count)-1]
            let chapterNo = proverb.keys.first!
            let verseNo = Int.random(in: 1...proverb.values.first!)
            
            verse = self.getVerseAsync("proverb", chapterNo, verseNo)
            
            semaphore.signal()
            
        }
        
        let timeoutInSecs = Double(5)
        _ = semaphore.wait(timeout: .now() + timeoutInSecs)
        
        return verse
    }
    
    // Async-Await Task
    private func getVerseAsync(_ bookName: String, _ chapterNo: Int, _ verseNo: Int) -> Verse? {
        
        var verse: Verse? = nil
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatchQueue = DispatchQueue.global(qos: .background)
        
        dispatchQueue.async {
            
            self.bibleService.getVerse(bookName, chapterNo, verseNo, onComplete: { (verseResult: Verse, webResponse) in
                
                if !webResponse.isError{
                    verse = verseResult
                } else {
                    print("BibleViewModel - getNewTestamentVerse - Error:", webResponse.error?.localizedDescription ?? "no error description found")
                }
                
                semaphore.signal()
            })
        }
        
        let timeoutInSecs = Double(5)
        _ = semaphore.wait(timeout: .now() + timeoutInSecs)
        
        return verse
        
    }
}
