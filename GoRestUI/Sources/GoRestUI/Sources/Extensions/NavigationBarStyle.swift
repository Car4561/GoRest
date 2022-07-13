//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import UIKit

public protocol NavigationBarStyle {
    
    func primaryStyle()
}

public extension NavigationBarStyle where Self: UIViewController {

    func primaryStyle() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = PCColors.tintedNavigationBar
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : PCColors.tintedNavigationBarItem]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = PCColors.tintedNavigationBarItem
        navigationItem.backButtonTitle = ""
    }
}
