//
//  PostListViewController.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import GoRestUI

class PostListViewController: UIViewController {

    var output: PostListViewOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: PostViewInput Methods

extension PostListViewController: PostListViewInput, GRActivityIndicatorPresentable {

    func setUpInitialState() {
    }

    func moduleInput() -> PostListModuleInput {
        return output as! PostListModuleInput
    }
    
    func showActivityIndicatorView() {
        showGRActivityIndicatorView()
    }
    
    func hideActivityIndicatorView() {
        hideGRActivityIndicatorView()
    }
}
