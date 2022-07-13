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
    
    var title: String!
    var body: String!
}


// MARK: PostDetailModuleInput methods

extension PostDetailPresenter: PostDetailModuleInput {

    func initializeModule(title: String, body: String) {
        self.title = title
        self.body = body
    }
}


// MARK: PostDetailViewOutput methods

extension PostDetailPresenter: PostDetailViewOutput {

    func viewIsReady() {
        view.setPost(title: title, body: body)
    }
}


// MARK: PostDetailInteractorOutput methods

extension PostDetailPresenter: PostDetailInteractorOutput {
}
