//
//  PostDetailViewInput.swift
//  GoRest
//
//  Created by Carlos Llerena on 13/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol PostDetailViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> PostDetailModuleInput
    func setPost(title: String, body: String)
}
