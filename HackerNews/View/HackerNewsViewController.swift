//
//  ViewController.swift
//  HackerNews
//
//  Created by Disha patel on 6/25/24.
//

import UIKit

class HackerNewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    var viewModel = HackerNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelCallBack()
        newsTableView.dataSource = self
        viewModel.fetchNews()
    }
}

extension HackerNewsViewController{
    func setupViewModelCallBack(){
        viewModel.reloadData = { [weak self] in
            self?.newsTableView.reloadData()
        }
    }
}

extension HackerNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HackerNewsTableViewCell", for: indexPath) as! HackerNewsTableViewCell
        if let news = viewModel.getNewsFor(row: indexPath.row){
            cell.setUp(newsInfo: news)
        }
        return cell
    }
}
