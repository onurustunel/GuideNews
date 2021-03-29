//
//  CategoryResultTVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class CategoryResultTVC: UITableViewCell {
    
    @IBOutlet weak var categoryResultimage: UIImageView!
    @IBOutlet weak var categoryResultTitle: UILabel!    
    @IBOutlet weak var categoryResultSource: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
