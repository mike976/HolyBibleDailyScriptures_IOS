//
//  DailyScriptureCell.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 22/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

class DailyScriptureCell: UITableViewCell {

    
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var verseInfoLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        verseLabel.text = ""
        verseInfoLabel.text = ""
        translationLabel.text = ""
        
        self.backgroundColor = UIColor.backgroundColor
        self.verseLabel.textColor = UIColor.navBarBackgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
