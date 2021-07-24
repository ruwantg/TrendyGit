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
       
        repositoryTableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: REPOSITORY_CELL_IDENTIFIER)
        
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
    }


}

extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryViewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: REPOSITORY_CELL_IDENTIFIER) as! RepositoryTableViewCell
        let product = repositoryViewModel.repositoryArray[indexPath.row]
//        cell.productName.text = product.name
//        cell.productQuantity.text = "\(product.quantity)"
        cell.textLabel?.text = product.name
        return cell
    }
    
}


