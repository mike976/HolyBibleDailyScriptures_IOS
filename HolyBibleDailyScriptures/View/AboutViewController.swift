//
//  AboutViewController.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 22/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController {

    @IBOutlet weak var appVersionAndBuildLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var openSourceLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.backgroundColor
        self.appVersionAndBuildLabel.textColor = UIColor.black
        self.aboutLabel.textColor = UIColor.black
        self.openSourceLabel.textColor = UIColor.black
        self.productLabel.textColor = UIColor.black
        
        
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        self.appVersionAndBuildLabel.font = UIFont.boldSystemFont(ofSize: 12)
        self.appVersionAndBuildLabel.text = "Holy Bible Daily Scriptures v\(versionNumber) build \(buildNumber)"
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()

         logoImageView.contentMode = .scaleAspectFill
         logoImageView.layer.cornerRadius = 5
         logoImageView.layer.borderColor = UIColor.clear.cgColor
         logoImageView.layer.borderWidth = 5
         logoImageView.layer.masksToBounds = true
         logoImageView.clipsToBounds = true
     }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
     
        let selection =  sender.titleLabel?.text!
        
        switch selection {
        case "share":
            shareApp()
            break
        case "email":
            sendEmail()
            break
        case "gitHub":
            loadGitHubPage()
            break
        case "linkedIn":
            loadLinkedInPage()
            break;
        default:
            print("error")
        }
    
        
    }
    
    private func shareApp() {
        let shareText: String = "Check out the Holy Bible Daily Scriptures app!"
        
        //TODO change this to be the app store link of the app to share once it is released
        //let url: URL = URL(string: "https://www.google.co.uk")!
        //let items: [Any] = [shareText, url]
        
        let items: [Any] = [shareText]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            
            let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            let mailComposerViewController = MFMailComposeViewController()
            mailComposerViewController.mailComposeDelegate = self
            mailComposerViewController.setToRecipients(["mikebullock976@gmail.com"])
            mailComposerViewController.setSubject("Hello!")
            mailComposerViewController.setMessageBody("\n\n\n\nSent from Holy Bible Daily Scriptures iOS - v\(versionNumber) build \(buildNumber)", isHTML: false)
            self.present(mailComposerViewController, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Can't send Email", message: "Your device can't send e-mail. Please check your email configuration and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go to settings", style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
                let settingsUrl = URL(string: UIApplication.openSettingsURLString)
                UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func loadGitHubPage(){
        let url = URL(string: "https://github.com/mike976")!
        self.open(url: url, withAlertMessage: "You will redirected to Github.")
    }
    
    private func loadLinkedInPage(){
           let url = URL(string: "https://uk.linkedin.com/in/michaelbullock976")!
           self.open(url: url, withAlertMessage: "You will be redirected to LinkedIn.")
       }
    
    private func open(url: URL, withAlertMessage message: String) {
        
        UserDefaults.performOnce(forKey: "com.mbullock976.hbds.leavingAppAlert", perform: {
            let alert = UIAlertController(title: "Leave the app?", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }, elsePerform: {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        })
    }

}

extension AboutViewController: MFMailComposeViewControllerDelegate {
    
    // MARK: -
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension UserDefaults {
    
    class func performOnce(forKey key: String, perform: () -> Void, elsePerform: (() -> Void)? = nil) {
        let once = self.standard.object(forKey: key)
        self.standard.set(true, forKey: key)
        self.standard.synchronize()
        if once == nil { perform() }
        else { elsePerform?() }
    }
}
