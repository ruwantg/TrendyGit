//
//  Repository.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import Foundation

class Repository : NSObject
{

    var imgUrl : String!
    var name : String!
    var stars : Int!

    init(dictionary: [String:Any])
    {
        imgUrl = dictionary["img_url"] as? String
        name = dictionary["name"] as? String
        stars = dictionary["quantity"] as? Int
    }
    
    init(name: String, image_url: String, quantity: Int)
    {
    self.name = name
    self.imgUrl = image_url
    self.stars = quantity
    }
    
    public class func modelsFromArray(array:[[String:Any]]) -> [Repository]
    {
        var models:[Repository] = []
        for item in array
        {
            models.append(Repository.init(dictionary:item))
        }
        return models
    }
}
