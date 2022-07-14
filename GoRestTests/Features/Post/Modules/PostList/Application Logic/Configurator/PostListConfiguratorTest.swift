//
//  PostListConfiguratorTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostListModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: PostViewControllerMock!
        var configurator: PostListModuleConfigurator!

        beforeEach {
            viewController = PostViewControllerMock()

            configurator = PostListModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A PostModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(PostListPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? PostListPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(PostListViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(PostListRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(PostListInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? PostListPresenter
                let interactor = presenter?.interactor as? PostListInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(PostListPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class PostViewControllerMock: PostListViewController {
    }
}
