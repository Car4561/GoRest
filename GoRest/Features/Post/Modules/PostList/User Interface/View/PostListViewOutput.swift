//
//  PostListViewOutput.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol PostListViewOutput {

    func viewIsReady()
    func didTapPost(post: Post)
    func retrieveNewPage()
}
