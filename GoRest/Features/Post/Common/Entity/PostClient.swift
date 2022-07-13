//
//  PostClient.swift
//  GoRest
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import Combine
import GoRestNetworking
import Foundation

protocol PostClientProvider {
    func postList(querys: [URLQueryItem]) -> AnyPublisher<PostResponse, NetworkingError>
}

final class PostClient: RestClient, PostClientProvider {
    func postList(querys: [URLQueryItem]) -> AnyPublisher<PostResponse, NetworkingError> {
        request(resource: PaymentsResource.paymentsList, querys: querys, type: PostResponse.self, errorType: ErrorResponse.self)
    }
}
