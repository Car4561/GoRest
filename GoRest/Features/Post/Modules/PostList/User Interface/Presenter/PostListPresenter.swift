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
    
    var currentPage = 0
}


// MARK: PostModuleInput methods

extension PostListPresenter: PostListModuleInput {

    func initializeModule() {
    }
}


// MARK: PostViewOutput methods

extension PostListPresenter: PostListViewOutput {

    func viewIsReady() {
        view.showActivityIndicatorView()
        interactor.getPostList(page: 1)
    }
    
    func retrieveNewPage() {
        let nextPage = currentPage + 1
        
        interactor.getPostList(page: nextPage)
    }
    
    func didTapPost(post: Post) {
        router.routeToPostDetail(title: post.title, body: post.body)
    }
}


// MARK: PostInteractorOutput methods

extension PostListPresenter: PostListInteractorOutput {
    
    func didFetchPostList(_ postList: [Post]) {
        view.hideActivityIndicatorView()
        currentPage += 1

        if currentPage == 1 {
            view.setPostList(postList)
        } else {
            view.appendToPostList(postList)
        }
    }
    
    func didFailFetchingPostList(title: String, message: String) {
        view.hideActivityIndicatorView()
    }
}
