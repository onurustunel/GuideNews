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

    
    func cellEdit(newsList : BreakingNews) { 
        searchCellTitle.text = newsList.title
        
        // Date Formating
        let date = "\(newsList.publishedAt?.prefix(10) ?? "")"
        searchCellSource.text = Helper.changeDateFormat(dateString: date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy")
        
        if let url = URL(string: "\(newsList.urlToImage ?? "")")
        {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.searchCellimage.image = image
                    }
                }
                
                
            }
        }
    }

}
