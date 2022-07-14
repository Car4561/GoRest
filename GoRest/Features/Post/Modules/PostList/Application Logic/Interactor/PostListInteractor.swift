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
    
    func getPostList(page: Int) {
        let querys = [URLQueryItem(name: PostStrings.queryPage, value: String(page))]
        postClient.postList(querys: querys)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .notConnectionInternet(_):
                        self?.output.didFailFetchingPostList()
                    case .unexpectedError(_):
                        self?.output.didFailFetchingPostList()
                    default:
                        self?.output.didFailFetchingPostList()
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didFetchPostList(response.data)
            }).store(in: &cancellables)
    }
}
