//
//  PostListViewController.swift
//  GoRest
//
//  Created by Carlos Llerena on 12/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import GoRestUI

class PostListViewController: UIViewController {

    // MARK: Properties
    var output: PostListViewOutput!
    
    var postList: [Post] = [] {
        didSet {
            postsTableView.reloadData()
        }
    }

    @IBOutlet weak var postsTableView: UITableView! {
        didSet {
            postsTableView.delegate = self
            postsTableView.dataSource = self
            postsTableView.separatorStyle = .none
            postsTableView.backgroundColor = GRColors.viewBackground2
            postsTableView.register(PostTableViewCell.self)
        }
    }
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.
        configureMainNavigation()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
       title = PostStrings.title
    }
}

// MARK: TableView Delegate & Data source

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PostTableViewCell
        let post = postList[indexPath.row]
        cell.configure(with: post)
        return cell
    }
}

// MARK: PostViewInput Methods

extension PostListViewController: PostListViewInput, GRActivityIndicatorPresentable {

    func setUpInitialState() {
    }

    func moduleInput() -> PostListModuleInput {
        return output as! PostListModuleInput
    }
    
    func setPostList(_ postList: [Post]) {
        self.postList = postList
    }
    
    func showActivityIndicatorView() {
        showGRActivityIndicatorView()
    }
    
    func hideActivityIndicatorView() {
        hideGRActivityIndicatorView()
    }
}
