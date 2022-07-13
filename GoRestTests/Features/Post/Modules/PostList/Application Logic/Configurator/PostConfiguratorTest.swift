//
//  PostConfiguratorTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: PostViewControllerMock!
        var configurator: PostListModuleConfigurator!

        beforeEach {
            viewController = PostViewControllerMock()

            configurator = PostModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A PostModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(PostPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? PostPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(PostViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(PostRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(PostInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? PostPresenter
                let interactor = presenter?.interactor as? PostInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(PostPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class PostViewControllerMock: PostListViewController {
    }
}
