//
//  PostDetailPresenter.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PostDetailPresenter {

    weak var view: PostDetailViewInput!
    var interactor: PostDetailInteractorInput!
    var router: PostDetailRouterInput!
}


// MARK: PostDetailModuleInput methods

extension PostDetailPresenter: PostDetailModuleInput {

    func initializeModule() {
    }
}


// MARK: PostDetailViewOutput methods

extension PostDetailPresenter: PostDetailViewOutput {

    func viewIsReady() {
    }
}


// MARK: PostDetailInteractorOutput methods

extension PostDetailPresenter: PostDetailInteractorOutput {
}
