//
//  PostDetailInitializer.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class PostDetailModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var postDetailViewController: PostDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = PostDetailModuleConfigurator()
        configurator.configureModuleForViewInput(postDetailViewController)
    }
}
