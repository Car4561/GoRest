//
//  PostInitializer.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class PostModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var postViewController: PostViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = PostModuleConfigurator()
        configurator.configureModuleForViewInput(postViewController)
    }
}
