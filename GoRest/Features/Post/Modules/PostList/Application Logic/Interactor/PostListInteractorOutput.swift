//
//  PostInteractorOutput.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol PostListInteractorOutput: AnyObject {
    func didFetchPostList(_ postList: [Post])
    func didFailFetchingPostList(title: String, message: String)
}
