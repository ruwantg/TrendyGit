//
//  ViewController.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RepositoryListViewController: UIViewController {
    
    let REPOSITORY_CELL_IDENTIFIER = "RepositoryCellIdentifier"
    let REPOSITORY_URL = "https://api.github.com/repositories"

    @IBOutlet weak var repositoryTableView: UITableView!
    
    let viewModel: RepositoryListViewModel = RepositoryListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let repositoryCell = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        repositoryTableView.register(repositoryCell, forCellReuseIdentifier: REPOSITORY_CELL_IDENTIFIER)
        
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        
        getRepositoryData(url: REPOSITORY_URL)
        
        configureTableView()
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        repositoryTableView.rowHeight = UITableView.automaticDimension
        repositoryTableView.estimatedRowHeight = 120.0
    }
    

    //MARK: - Networking

    
    func getRepositoryData(url: String) {
    
        Alamofire.request(url, method: .get).responseJSON {
            response in

            if response.result.isSuccess {
                print("Success! Got the repository data")

                let repositoryJSON = JSON(response.result.value)

                self.viewModel.updateRepositoryData(json: repositoryJSON)
                
                self.repositoryTableView.reloadData()

            } else {
                print("Error \(response.result.error)")
//                self.cityLabel.text = "Connection Issues"
            }
        }
    }

}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: REPOSITORY_CELL_IDENTIFIER, for: indexPath) as! RepositoryTableViewCell
        let repository = viewModel.repositoryArray[indexPath.row]

        cell.setRepositoryData(repository: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let repositoryDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "RepositoryDetailViewController") as! RepositoryDetailViewController
        
        repositoryDetailViewController.repository = viewModel.repositoryArray[indexPath.row]
        
        self.navigationController!.pushViewController(repositoryDetailViewController, animated: true)
    }
    
}


