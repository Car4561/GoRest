//
//  PostDetailPresenterTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostDetailPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A PostDetail Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: PostDetailInteractorInput {
    }

    private class MockRouter: PostDetailRouterInput {
    }

    private class MockView: PostDetailViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> PostDetailModuleInput {

            return PostDetailPresenter()
	    }
        
        func setPost(title: String, body: String) {
            
        }
    }
}
