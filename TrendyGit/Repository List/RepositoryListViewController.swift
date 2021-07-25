//
//  ViewController.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {
    
    let REPOSITORY_CELL_IDENTIFIER = "RepositoryCellIdentifier"

    @IBOutlet weak var repositoryTableView: UITableView!
    
    let repositoryViewModel: RepositoryListViewModel = RepositoryListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let repositoryCell = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        repositoryTableView.register(repositoryCell, forCellReuseIdentifier: REPOSITORY_CELL_IDENTIFIER)
        
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        
        configureTableView()
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        repositoryTableView.rowHeight = UITableView.automaticDimension
        repositoryTableView.estimatedRowHeight = 120.0
    }


}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryViewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: REPOSITORY_CELL_IDENTIFIER, for: indexPath) as! RepositoryTableViewCell
        let repository = repositoryViewModel.repositoryArray[indexPath.row]

        cell.setRepositoryData(repository: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let repositoryDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "RepositoryDetailViewController") as! RepositoryDetailViewController
        self.navigationController!.pushViewController(repositoryDetailViewController, animated: true)
    }
    
}


