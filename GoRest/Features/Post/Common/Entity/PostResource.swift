//
//  PostResource.swift
//  GoRest
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import GoRestNetworking

enum PaymentsResource: Resource {

    case paymentsList

    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .paymentsList:
            return (.get, "/posts")
        }
    }
}
