//
//  SearchTVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class SearchTVC: UITableViewCell {
    
    
    @IBOutlet weak var searchCellimage: UIImageView!
    @IBOutlet weak var searchCellTitle: UILabel!
    
    @IBOutlet weak var searchCellSource: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
