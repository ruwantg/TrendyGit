//
//  RepositoryDetailViewController.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/25/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    
    
    var repository: Repository?

    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleBar()
        setUIView()
        
    }
    
    func setTitleBar () {
        self.title = repository?.name
        let backBTN = UIBarButtonItem(image: UIImage(named: "back"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func setUIView () {
        fullName.text = repository?.fullName
        repositoryDescription.text = repository?.desc
        
    }

}
