//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import UIKit

protocol ReusableViewIdentifier: AnyObject {
    
    static var reuseIdentifier: String { get }
}

extension ReusableViewIdentifier where Self: UIView {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
