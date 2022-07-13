//
//  Post.swift
//  GoRest
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

struct Post: Decodable {
    let id: Int
    let user_id: Int
    let title: String
    let body: String
}
