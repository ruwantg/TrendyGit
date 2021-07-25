//
//  RepositoryViewModel.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import Foundation


class RepositoryListViewModel: NSObject {
    
    var repositoryArray = Array<Repository>()

    override init() {
        let repository1 = Repository(name: "Flutter", image_url: "", quantity: 232)
        let repository2 = Repository(name: "Pink Nation", image_url: "", quantity: 789)
        let repository3 = Repository(name: "Rise", image_url: "", quantity: 35)
        repositoryArray.append(repository1)
        repositoryArray.append(repository2)
        repositoryArray.append(repository3)
    }

    func numberOfRowsInSection() -> Int {
        return repositoryArray.count
    }
    
}
