//
//  StudyGuideViewController.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 22/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

class StudyGuideViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var dailyScripturesHeaderLabel: UILabel!
    @IBOutlet weak var verseOfTheDayHeaderLabel: UILabel!
    @IBOutlet weak var studyGuideHeaderLabel: UILabel!
    
    
    @IBOutlet weak var dailyScripturesDetailLabel: UILabel!
    @IBOutlet weak var verseOfTheDayDetailLabel: UILabel!
    @IBOutlet weak var studyGuideDetailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        initalize()
    }

    private func initalize() {
        
        self.navBar.barTintColor = UIColor.navBarBackgroundColor
        self.navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navBar.delegate = self
        self.view.backgroundColor = UIColor.backgroundColor
        
        self.dailyScripturesHeaderLabel?.textColor = UIColor.black
        self.verseOfTheDayHeaderLabel?.textColor = UIColor.black
        self.studyGuideHeaderLabel?.textColor = UIColor.black
        self.dailyScripturesDetailLabel?.textColor = UIColor.black
        self.verseOfTheDayDetailLabel?.textColor = UIColor.black
        self.studyGuideDetailLabel?.textColor = UIColor.black
        
        self.updateHeaderLabels()
        self.updateDetailLabels()
    }

    private func updateHeaderLabels() {
        self.dailyScripturesHeaderLabel?.text = "Daily Scriptures"
        self.verseOfTheDayHeaderLabel?.text = "Verse Of The Day"
        self.studyGuideHeaderLabel?.text = "Study Guide"
        
    }
    
    private func updateDetailLabels() {
        
        
        //Daily Scriptures
        
        self.dailyScripturesDetailLabel?.text = "Three versus taken from the New Testament, Book of Psalms and Proverbs that will serve as a great way to pickup your Bible and further your reading and understanding of the The Word of God."
        
        
        self.verseOfTheDayDetailLabel?.text = "If you're looking for a wonderful way to begin the day, generating a random Bible verse of the day can be an excellent way to do so. \n\nThere's something special beginning the day with the word of God. Since the verse that appears will be completely random, it'll be a surprise and give you a chance to consider it deeply throughout the day. By focusing on a single verse of the day, you can delve thoroughly into what it means to you and your life."
        
        
        self.studyGuideDetailLabel?.text = "Please use the scriptures in this app to further read the surrounding scriptures from a book of Holy Bible itself.\n\nBelow are some tips to offer as a guide when studying scripture, using the Four R principles below:\n\nREAD:\n\n- As you read the scripture, familiarise yourself with the context of the text.\n- Examples could include, Who are the characters involved?, What are their motives, emotions and present state of mind?\n- Make a note of the author. Who are they writing about and Why\n- What was the outcome?, What was conveyed to you?\n\nREFLECT:\n\nSpend time meditating on what you've just read and determine the type of truth it is, for instance..Is it a:\n\n\tPrinciple - a conditional truth\n\tPromise - unconditional truth\n\tCommand - The Lord's Command or Law to obey\n\nWhat lessons have you learn't from this text?\n\nREFLECT:\n\nUse this time to answer some questions below, such as:\n\n\tHow can I turn the lessons learn't into actions?\n\tHow may I incorporate these actions into my daily life?\n\nREQUEST:\n\nUse this time for prayer.\n\n\tPray to The Lord about what you've learn't from the scripture, about Him and yourself\n\tPray to The Lord to help you to implement your new actions into your daily life\n\tGive thanks to The Lord about what you've learned and ask Him for help to better understand the scriptures.\n\nThese are just some tips and no way is a rule to follow when studying scripture and the Holy Bible\n\nIt is my sincere hope that this app will encourage you to seek The Lord, Our God, by presenting you with scriptures that you can use along with the book of the Holy Bible\n\nMay The Lord bring comfort and encourage you in everything that you do.\n\nIf this is app is a help to you, please be so kind to share with others.\n\nThank you and God Bless\n\nMichael"
        
        
        
    }
    
}



extension StudyGuideViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
}
