//
//  PostListPresenterTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostListPresenterTest: QuickSpec {
    
    override func spec() {
        
        var presenter: PostListPresenter!
        var interactor: MockInteractor!
        var router: MockRouter!
        var view: MockView!
        
        beforeEach {
            presenter = PostListPresenter()
            interactor = MockInteractor()
            router = MockRouter()
            view = MockView()
            
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
        }
        
        afterEach {
            presenter = nil
            interactor = nil
            router = nil
            view = nil
        }
        
        describe("A Post Presenter") {
            
            context("ViewOutput conformance") {
                
                it("Should get post list") {
                    presenter.viewIsReady()
                    
                    expect(view.showActivityIndicatorViewCount).to(equal(1))
                    expect(interactor.page).to(equal(1))
                    expect(interactor.getPostListCount).to(equal(1))
                }
                
                it("Should retrieve post list for new page") {
                    presenter.retrieveNewPage()
                    
                    expect(interactor.getPostListCount).to(equal(1))
                }
                
                it("Should show post detail ") {
                    let post = Post(id: 1, user_id: 1, title: "title", body: "body")
                    presenter.didTapPost(post: post)
                    
                    expect(router.routeToPostDetail).to(equal(1))
                    expect(router.title).to(equal(post.title))
                    expect(router.body).to(equal(post.body))
                }
            }
            
            context("InteractorOutput conformance") {
                
                it("Should set inital post page") {
                    presenter.currentPage = 0
                    
                    let postList = [Post(id: 1, user_id: 1, title: "title", body: "body")]
                    presenter.didFetchPostList(postList)
                    
                    expect(view.postList).toNot(beNil())
                    expect(view.hideActivityIndicatorViewCount).to(equal(1))
                }
                
                it("Should append new post page") {
                    presenter.currentPage = 2
                    
                    let postList = [Post(id: 1, user_id: 1, title: "title", body: "body")]
                    
                    presenter.didFetchPostList(postList)
                    
                    expect(view.postList).toNot(beNil())
                    expect(view.appendToPostListCount).to(equal(1))
                }
                
                it("Should fail to fetch authorizations list") {
                    presenter.didFailFetchingPostList()

                    expect(view.hideActivityIndicatorViewCount).to(equal(1))
                }
            }
        }
    }
    
    
    // MARK: Mock Classes
    
    private class MockInteractor: PostListInteractorInput {
        
        var page: Int?
        var getPostListCount = 0
        
        func getPostList(page: Int) {
            self.page = page
            getPostListCount += 1
        }
    }
    
    private class MockRouter: PostListRouterInput {
        
        var routeToPostDetail = 0
        
        var title: String?
        var body: String?
        
        func routeToPostDetail(title: String, body: String) {
            self.title = title
            self.body = body
            routeToPostDetail += 1
        }
    }
    
    private class MockView: PostListViewInput {
        
        var setPostListCount = 0
        var appendToPostListCount = 0
        
        var showActivityIndicatorViewCount = 0
        var hideActivityIndicatorViewCount = 0
        
        var postList: [Post]?
        
        func setPostList(_ postList: [Post]) {
            self.postList = postList
            setPostListCount += 1
        }
        
        func appendToPostList(_ postList: [Post]) {
            self.postList = postList
            appendToPostListCount += 1
        }
        
        func showActivityIndicatorView() {
            showActivityIndicatorViewCount += 1
        }
        
        func hideActivityIndicatorView() {
            hideActivityIndicatorViewCount += 1
        }
        
        func setUpInitialState() {
        }
        
        func moduleInput() -> PostListModuleInput {
            
            return PostListPresenter()
        }
    }
}
