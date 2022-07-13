//
//  PostPresenterTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A Post Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: PostInteractorInput {
    }

    private class MockRouter: PostRouterInput {
    }

    private class MockView: PostViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> PostModuleInput {

            return PostPresenter()
	    }
    }
}
