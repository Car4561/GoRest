//
//  GRColors.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import UIKit

public enum GRColors {
    
    // MARK: - NAME
    
    enum Name {
        
        static let buttonPrimary = "buttonPrimary"
        static let buttonSecondary = "buttonSecondary"
        
        static let grabberView = "grabberView"
        
        static let labelPrimary = "labelPrimary"
        static let labelSecondary = "labelSecondary"
        
        static let progressViewTrack = "progressViewTrack"
        
        static let textFieldText = "textFieldText"
        static let textFieldPlaceholder = "textFieldPlaceholder"

        static let tabBarTint = "tabBarTint"
        
        static let tintedNavigationBar = "tintedNavigationBar"
        static let tintedNavigationBarItem = "tintedNavigationBarItem"
        
        static let viewBackground1 = "viewBackground1"
        static let viewBackground2 = "viewBackground2"
    }
    
    
    // MARK: - COLORS

    public static let buttonPrimary = UIColor.loadColor(named: Name.buttonPrimary)
    
    public static let buttonSecondary = UIColor.loadColor(named: Name.buttonSecondary)

    public static let grabberView = UIColor.loadColor(named: Name.grabberView)
    
    public static let labelPrimary = UIColor.loadColor(named: Name.labelPrimary)
    
    public static let labelSecondary = UIColor.loadColor(named: Name.labelSecondary)
    
    public static let progressViewTrack = UIColor.loadColor(named: Name.progressViewTrack)
    
    public static let textFieldText = UIColor.loadColor(named: Name.textFieldText)
    
    public static let textFieldPlaceholder = UIColor.loadColor(named: Name.textFieldPlaceholder)
    
    public static let tabBarTint = UIColor.loadColor(named: Name.tabBarTint)
    
    public static let tintedNavigationBar = UIColor.loadColor(named: Name.tintedNavigationBar)
    
    public static let tintedNavigationBarItem = UIColor.loadColor(named: Name.tintedNavigationBarItem)
    
    public static let viewBackground1 = UIColor.loadColor(named: Name.viewBackground1)
    
    public static let viewBackground2 = UIColor.loadColor(named: Name.viewBackground2)
}
