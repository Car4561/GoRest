//
//  PostListInitializer.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class PostListModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var postListViewController: PostListViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = PostListModuleConfigurator()
        configurator.configureModuleForViewInput(postListViewController)
    }
}
