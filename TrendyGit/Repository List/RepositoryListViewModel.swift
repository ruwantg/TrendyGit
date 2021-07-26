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
    
    override init() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return repositoryArray.count
    }
    
}

extension RepositoryListViewModel {
    
    //MARK: - JSON Parsing
    
    func updateRepositoryData(json : JSON) {
        
        
        //        if let tempResult = json["owner"]["id"].int {
        
        //        print(json[0]["name"])
        //        print(json[0]["full_name"])
        //        print(json.array?.count)
        
        
        for item in json {
            //            print(item.1["name"])
            
            let name = item.1["name"].stringValue
            let fullName = item.1["full_name"].stringValue
            let desc = item.1["description"].stringValue
            let repository = Repository(name: name, fullName: fullName, description: desc, image_url: "", quantity: 747)
            repositoryArray.append(repository)
        }
        
        
        
        //            let repository = Repository(name: json[0]["name"].stringValue, image_url: "", quantity: 35)
        //            viewModel.repositoryArray.append(repository)
        
        //            repositoryDataModel.tempereture = Int(tempResult - 273.15)
        //            repositoryDataModel.city = json["name"].stringValue
        //            repositoryDataModel.condition = json["repository"][0]["id"].intValue
        //            repositoryDataModel.repositoryIconName = repositoryDataModel.updateRepositoryIcon(condition: repositoryDataModel.condition)
        
        updateUIWithRepositoryData()
        
        //        } else {
        //            cityLabel.text = "Repository Unavailable"
        //        }
        
    }
    
    
    
    
    
    //MARK: - UI Updates
    
    func updateUIWithRepositoryData() {
        //        cityLabel.text = repositoryDataModel.city
        //        temperatureLabel.text = "\(String(repositoryDataModel.tempereture))°"
        //        repositoryIcon.image = UIImage(named: repositoryDataModel.repositoryIconName)
    }
    
}
