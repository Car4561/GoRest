//
//  UITableView+Extensions.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import UIKit

extension UITableViewCell: ReusableViewIdentifier, NibLoadableView {}

extension UITableView {

    public func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
