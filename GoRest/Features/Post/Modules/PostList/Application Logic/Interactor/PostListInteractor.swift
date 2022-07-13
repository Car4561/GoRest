//
//  PostListInteractor.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation
import Combine

class PostListInteractor: PostListInteractorInput {

    weak var output: PostListInteractorOutput!
    lazy var networkingService: NetworkingService = NetworkingService()
    lazy var postClient: PostClientProvider = PostClient(configuration: NetworkingService().configuration)
    var cancellables: Set<AnyCancellable> = []
    
    func getPostList() {
        let querys = [URLQueryItem(name: PostStrings.queryPage, value: "4")]
        postClient.postList(querys: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .notConnectionInternet(let error):
                        self?.output.didFailFetchingPostList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageInternetError)
                    case .unexpectedError(_):
                        self?.output.didFailFetchingPostList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    default:
                        self?.output.didFailFetchingPostList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didFetchPostList(response.data)
            }).store(in: &cancellables)
    }
}
