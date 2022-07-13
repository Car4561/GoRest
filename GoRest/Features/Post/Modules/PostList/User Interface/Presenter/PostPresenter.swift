//
//  PostPresenter.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PostPresenter {

    weak var view: PostViewInput!
    var interactor: PostInteractorInput!
    var router: PostRouterInput!
}


// MARK: PostModuleInput methods

extension PostPresenter: PostModuleInput {

    func initializeModule() {
    }
}


// MARK: PostViewOutput methods

extension PostPresenter: PostViewOutput {

    func viewIsReady() {
    }
}


// MARK: PostInteractorOutput methods

extension PostPresenter: PostInteractorOutput {
}
