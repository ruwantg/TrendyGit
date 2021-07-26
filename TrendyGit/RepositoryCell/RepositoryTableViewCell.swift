//
//  RepositoryTableViewCell.swift
//  TrendyGit
//
//  Created by Ruwan Thalgahage on 7/24/21.
//  Copyright © 2021 Ruwan Thalgahage. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    @IBOutlet weak var numberOfStars: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRepositoryData(repository: Repository) {
        self.repositoryName?.text = repository.name
        self.repositoryDescription?.text = repository.desc
        self.numberOfStars?.text = String(repository.stars)
    }
    
}
