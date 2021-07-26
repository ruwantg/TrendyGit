//
//  RepositoryViewModel.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import Foundation
import SwiftyJSON

class RepositoryListViewModel: NSObject {
    
    var repositoryArray = Array<Repository>()
    
    override init() {}
    
    func numberOfRowsInSection() -> Int {
        return repositoryArray.count
    }
    
}

extension RepositoryListViewModel {
    
    //MARK: - JSON Parsing
    
    func updateRepositoryData(json : JSON) {
        
        for item in json {
            if let repositoryName = item.1["name"].string {
                let name = repositoryName
                let fullName = item.1["full_name"].stringValue
                let desc = item.1["description"].stringValue
                let imageURL = item.1["owner"]["avatar_url"].stringValue
                let repository = Repository(name: name, fullName: fullName, description: desc, image_url: imageURL, quantity: 747)
                repositoryArray.append(repository)
            } else {
//                errorLabel.text = "Repository Unavailable"
            }
        }
        
        updateUIWithRepositoryData()
        
    }
    
    //MARK: - UI Updates
    
    func updateUIWithRepositoryData() {
        
        
    }
    
}
