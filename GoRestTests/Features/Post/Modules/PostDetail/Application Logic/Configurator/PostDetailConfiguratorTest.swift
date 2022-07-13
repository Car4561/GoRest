//
//  PostDetailConfiguratorTest.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import GoRest

final class PostDetailModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: PostDetailViewControllerMock!
        var configurator: PostDetailModuleConfigurator!

        beforeEach {
            viewController = PostDetailViewControllerMock()

            configurator = PostDetailModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A PostDetailModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(PostDetailPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? PostDetailPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(PostDetailViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(PostDetailRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(PostDetailInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? PostDetailPresenter
                let interactor = presenter?.interactor as? PostDetailInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(PostDetailPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class PostDetailViewControllerMock: PostDetailViewController {
    }
}
