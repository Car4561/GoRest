//
//  PostDetailViewController.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    var output: PostDetailViewOutput!

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var bodyTextView: UITextView! {
        didSet {
            bodyTextView.textAlignment = .justified
        }
    }
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: PostDetailViewInput Methods

extension PostDetailViewController: PostDetailViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> PostDetailModuleInput {
        return output as! PostDetailModuleInput
    }
}
