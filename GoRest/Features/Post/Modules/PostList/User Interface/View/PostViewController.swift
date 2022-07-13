//
//  PostViewController.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    var output: PostViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: PostViewInput Methods

extension PostViewController: PostViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> PostModuleInput {
        return output as! PostModuleInput
    }
}
