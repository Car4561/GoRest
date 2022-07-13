//
//  PostConfigurator.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PostModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? PostViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PostViewController) {

        let router = PostRouter()

        let presenter = PostPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PostInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
