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
        appearance.backgroundColor = GRColors.tintedNavigationBar
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : GRColors.tintedNavigationBarItem]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = GRColors.tintedNavigationBarItem
        navigationItem.backButtonTitle = ""
    }
}
