//
//  FirstViewController.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 21/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

class DailyScripturesViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
        
    private var loadingScriptures = false;
    private var newTestamentVerse: Verse?
    private var psalmVerse: Verse?
    private var proverbVerse: Verse?
    
    var categories = ["New Testament", "Psalms", "Proverbs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.backgroundColor
        self.navigationBar.barTintColor = UIColor.navBarBackgroundColor
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.delegate = self
        
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.backgroundColor
        self.tableView.register(UINib(nibName: "DailyScriptureCell", bundle: nil), forCellReuseIdentifier: "DailyScriptureCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.loadScriptures()
    }

    var bibleViewModel: BibleViewModelProtocol?
    {
        didSet {
            self.loadScriptures()
        }
    }
    
    func loadScriptures() {
        
        if self.loadingScriptures == true {
            return
        }
        
        self.loadingScriptures = true
        
        if bibleViewModel != nil {
            
            let dispatchQueue = DispatchQueue.global(qos: .background)
            
            dispatchQueue.async {
                self.getNewTestamentVerse()
                self.getPsalmVerse()
                self.getProverbVerse()
            }
        }
    }
    
    private func getNewTestamentVerse(){

        if let verse = self.bibleViewModel?.getNewTestamentVerse(){
            
           DispatchQueue.main.async {
            
                 self.newTestamentVerse = verse
                 self.tableView.reloadData()
                            
            }
        }
    }
    
    private func getPsalmVerse(){

        if let verse = self.bibleViewModel?.getPsalmVerse() {
            
           DispatchQueue.main.async {
             
                self.psalmVerse = verse
                self.tableView.reloadData()
            }
        }
    }
    
    private func getProverbVerse(){

        if let verse = self.bibleViewModel?.getProverbVerse() {
            
           DispatchQueue.main.async {
            self.proverbVerse = verse
            self.tableView.reloadData()
        }
    }
}

}


//MARK: - TableViewController section
extension DailyScripturesViewController : UITableViewDataSource, UITableViewDelegate {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyScriptureCell", for: indexPath) as! DailyScriptureCell
    
        var verse: Verse?
        if indexPath.section == 0 {
            verse = self.newTestamentVerse
        } else if indexPath.section == 2 {
            verse = self.psalmVerse
        } else if indexPath.section == 4 {
            verse = self.proverbVerse
        }
        
        if verse != nil {
            cell.verseLabel?.text = verse?.Text
            cell.verseInfoLabel?.text = verse?.Reference
            cell.translationLabel?.text = verse?.TranslationName
        }
        
        return cell
            
    }
}

extension DailyScripturesViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
}
