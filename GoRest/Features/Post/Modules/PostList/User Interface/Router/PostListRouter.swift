//
//  PostListRouter.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PostListRouter: PostListRouterInput, Routable {
    
    weak var viewController: PostListViewController!

    func routeToPostDetail(title: String, body: String) {
        pushViewController(withIdentifer: PostDetailViewController.storyboardIdentifier,
                           type: PostDetailViewController.self,
                           in: .post,
                           from: viewController) { controller in
            controller.moduleInput().initializeModule(title: title, body: body)
        }
    }
}
