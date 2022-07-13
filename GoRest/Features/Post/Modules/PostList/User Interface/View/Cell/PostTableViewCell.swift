//
//  PostTableViewCell.swift
//  GoRest
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import UIKit
import GoRestUI

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = GRColors.viewBackground1
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = GRColors.labelPrimary
        }
    }
    
    
    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            bodyLabel.numberOfLines = 2
        }
    }
    
    func configure(with post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
