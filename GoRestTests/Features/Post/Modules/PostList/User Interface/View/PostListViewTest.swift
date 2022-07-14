//
//  PostListViewTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick
import UIKit

@testable import GoRest

final class PostListViewTest: QuickSpec {

    override func spec() {
        
        var viewController: PostListViewController!
        var output: MockOutput!
        
        beforeEach {
            let storyboard = UIStoryboard.storyboard(.post)
            let identifier = PostListViewController.storyboardIdentifier
            
            viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? PostListViewController
            viewController.loadView()
            
            output = MockOutput()
            viewController.output = output
        }

        afterEach {
            viewController = nil
            output = nil
        }

        describe("A Post View") {
            describe("A AuthorizationsHome View") {
                
                it("view ready") {
                    viewController.viewDidLoad()
                    
                    expect(output.viewIsReadyCount).to(equal(1))
                }
                
                it("should tap post") {
                    let postList = [Post(id: 1, user_id: 1, title: "title", body: "body")]
                    let indexPath = IndexPath(row: 0, section: 0)

                    viewController.filteredPostList = postList
                    viewController.tableView(viewController.postsTableView, didSelectRowAt: indexPath)
                    
                    expect(output.didTapPostCount).to(equal(1))
                }
                
                it("should request for a new page when index row threshold is reached") {
                    let threshold = (1 * viewController.pageSize) - viewController.scrollingThreshold
                    let indexPath = IndexPath(row: threshold, section: 0)
                    
                    viewController.currentPage = 1
                    
                    viewController.tableView(viewController.postsTableView, willDisplay: PostTableViewCell(), forRowAt: indexPath)
                    
                    expect(output.retrieveNewPageCount).to(equal(1))
                }
            }
        }
    }


    // MARK: Mock Classes

    private class MockOutput: PostListViewOutput {

        var viewIsReadyCount = 0
        var retrieveNewPageCount = 0
        var didTapPostCount = 0
        
        var post: Post?

        func viewIsReady() {
            viewIsReadyCount += 1
        }
        
        func didTapPost(post: Post) {
            self.post = post
            didTapPostCount += 1
        }
        
        func retrieveNewPage() {
            retrieveNewPageCount += 1
        }
        
    }
}
