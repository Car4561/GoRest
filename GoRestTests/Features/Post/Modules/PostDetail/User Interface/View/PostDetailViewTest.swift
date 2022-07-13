//
//  PostDetailViewTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostDetailViewTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A PostDetail View") {
        }
    }


    // MARK: Mock Classes

    private class MockOutput: PostDetailViewOutput {

        var viewIsReadyCount = 0

        func viewIsReady() {
            viewIsReadyCount += 1
        }
    }
}
