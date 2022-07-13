//
//  PostListPresenter.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PostListPresenter {

    weak var view: PostListViewInput!
    var interactor: PostListInteractorInput!
    var router: PostListRouterInput!
}


// MARK: PostModuleInput methods

extension PostListPresenter: PostListModuleInput {

    func initializeModule() {
    }
}


// MARK: PostViewOutput methods

extension PostListPresenter: PostListViewOutput {

    func viewIsReady() {
    }
}


// MARK: PostInteractorOutput methods

extension PostListPresenter: PostListInteractorOutput {
}
