//
//  UIColorExtension.swift
//  HolyBibleDailyScriptures
//
//  Created by Michael Bullock on 22/07/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

extension UIColor {
       
    // MARK: Private
    private static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    private static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    // MARK: Public
    
    static let navBarBackgroundColor = rgb(101, 67, 33)
    static let tabBarBackgroundColor = rgb(245, 222, 179)
    static let backgroundColor = rgb(255, 248, 220)
    static let textColor = UIColor.white
}
