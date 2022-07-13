//
//  GRActivityIndicatorPresentable.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import UIKit

fileprivate var grActivityIndicatorView: GRActivityIndicatorView!

public protocol GRActivityIndicatorPresentable {
    
    func showPCActivityIndicatorView()
    func hidePCActivityIndicatorView()
}

public extension GRActivityIndicatorPresentable where Self: UIViewController {
    
    func showPCActivityIndicatorView() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        let frame = keyWindow?.bounds ?? self.view.bounds
        grActivityIndicatorView = GRActivityIndicatorView(frame: frame)
        
        if let window = keyWindow {
            window.addSubview(grActivityIndicatorView)
        } else {
            self.view.addSubview(grActivityIndicatorView)
        }
    }
    
    func hidePCActivityIndicatorView() {
        grActivityIndicatorView?.removeFromSuperview()
    }
}
