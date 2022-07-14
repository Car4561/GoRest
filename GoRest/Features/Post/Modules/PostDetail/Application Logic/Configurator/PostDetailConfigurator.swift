//
//  PostDetailConfigurator.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class PostDetailModuleConfigurator {

    func configureModuleForViewInput(_ viewInput: UIViewController) {

        if let viewController = viewInput as? PostDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PostDetailViewController) {

        let router = PostDetailRouter()

        let presenter = PostDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PostDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
