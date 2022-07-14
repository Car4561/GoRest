//
//  PostListInteractorTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostListInteractorTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A Post Interactor") {
        }
    }


    // MARK: Mock Classes

    private class MockPresenter: PostListInteractorOutput {
        func didFetchPostList(_ postList: [Post]) {
            
        }
        
        func didFailFetchingPostList() {
            
        }
    }
}
