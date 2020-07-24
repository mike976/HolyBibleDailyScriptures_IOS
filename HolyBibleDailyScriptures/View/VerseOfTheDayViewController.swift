//
//  SecondViewController.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

class VerseOfTheDayViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var verseInfoLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    private var loadingScriptures = false;
    private var verseOfTheDay: Verse?
    
    var bibleViewModel: BibleViewModelProtocol?
//    {
//        didSet {
//            self.loadScriptures()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navBar.barTintColor = UIColor.navBarBackgroundColor
        self.navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navBar.delegate = self
        self.view.backgroundColor = UIColor.backgroundColor
        
        self.verseInfoLabel?.text = ""
        self.verseLabel?.text = ""
        self.translationLabel?.text = ""
        
        self.verseLabel?.textColor = UIColor.navBarBackgroundColor
        self.verseInfoLabel.textColor = UIColor.black
        self.translationLabel.textColor = UIColor.black
     
        
        self.loadScriptures()
        
        
    }
    
    func loadScriptures() {
        
        if self.loadingScriptures == true {
            return
        }
        
        self.loadingScriptures = true
        
        if bibleViewModel != nil {
            
            let dispatchQueue = DispatchQueue.global(qos: .background)
            
            dispatchQueue.async {

                let randomNo = Int.random(in: 1...3)
             
                if let verse = self.getVerse(randomNo) {
                    
                   DispatchQueue.main.async {
                    
                        self.verseOfTheDay = verse
                        self.verseLabel?.text = verse.Text!
                        self.verseInfoLabel?.text = verse.Reference!
                    self.translationLabel?.text = verse.TranslationName!
                    }
                }
                
            }
        }
    }
    
    private func getVerse(_ bookNo: Int) -> Verse? {

        switch bookNo {
        case 1:
            return self.bibleViewModel?.getNewTestamentVerse()
        case 2:
            return self.bibleViewModel?.getPsalmVerse()
        case 3:
            return self.bibleViewModel?.getProverbVerse()
        
        default:
            return self.bibleViewModel?.getNewTestamentVerse()
        }
    }
    
    
}

extension VerseOfTheDayViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
}
