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
    
    let pageSize = 10
    let scrollingThreshold = 3
    var currentPage = 0
    
    var postList: [Post] = []
    
    var filteredPostList: [Post] = [] {
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

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = PostStrings.search
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.definesPresentationContext = false
        searchController.searchBar.searchBarStyle = .default;
        searchController.automaticallyShowsCancelButton = true
        return searchController
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: View set up code goes here. Please remove this comment.
        configureMainNavigation()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
        title = PostStrings.title
        navigationItem.searchController = searchController
    }
    
    func filterContent(searchText: String){
        filteredPostList = searchText.isEmpty ? postList : postList.filter { post in
            return post.title.lowercased().contains(searchText)
        }
    }
}

// MARK: TableView Delegate & Data source

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPostList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PostTableViewCell
        let post = filteredPostList[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = filteredPostList[indexPath.row]
        output.didTapPost(post: post)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (currentPage * pageSize) - scrollingThreshold {
            output.retrieveNewPage()
        }
    }
}

extension PostListViewController: UISearchResultsUpdating{

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filterContent(searchText: searchText.lowercased())
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
        currentPage = 1
        self.postList = postList
        self.filteredPostList = self.postList
    }
    
    func appendToPostList(_ postList: [Post]) {
        currentPage += 1
        self.postList.append(contentsOf: postList)
        self.filteredPostList = self.postList
    }
    
    func showActivityIndicatorView() {
        showGRActivityIndicatorView()
    }
    
    func hideActivityIndicatorView() {
        hideGRActivityIndicatorView()
    }
}
