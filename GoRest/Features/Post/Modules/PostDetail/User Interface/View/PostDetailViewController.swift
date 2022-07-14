//
//  PostDetailViewController.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import GoRestUI

class PostDetailViewController: UIViewController {

    var output: PostDetailViewOutput!

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.textColor = GRColors.labelPrimary
        }
    }
    
    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            bodyLabel.textAlignment = .justified
        }
    }
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }

    deinit {
        print("deinit PostDetailViewController")
    }
}


// MARK: PostDetailViewInput Methods

extension PostDetailViewController: PostDetailViewInput {
    
    func setUpInitialState() {
    }

    func moduleInput() -> PostDetailModuleInput {
        return output as! PostDetailModuleInput
    }
    
    func setPost(title: String, body: String) {
        titleLabel.text = title
        bodyLabel.text = body
    }
}
