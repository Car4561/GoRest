//
//  PostListConfigurator.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class PostListModuleConfigurator {

    func configureModuleForViewInput(_ viewInput: UIViewController) {

        if let viewController = viewInput as? PostListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PostListViewController) {

        let router = PostListRouter()
        router.viewController = viewController

        let presenter = PostListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PostListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
