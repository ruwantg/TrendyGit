//
//  RepositoryDetailViewController.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/25/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import UIKit
import SVProgressHUD

class RepositoryDetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    
    var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleBar()
        setUIView()
        
    }
    
    func setTitleBar () {
        self.title = repository?.name.capitalized
        let backBTN = UIBarButtonItem(image: UIImage(named: "back"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func setUIView () {
        repositoryImageView.downloaded(from: repository?.imgUrl ?? "")
        fullName.text = repository?.fullName
        repositoryDescription.text = repository?.desc
        
    }

}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
