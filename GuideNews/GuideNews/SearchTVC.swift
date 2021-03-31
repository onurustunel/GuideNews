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
    /*
     let publishedDate : Date = news.publishedAt as? Date ?? Date()
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "MMM/dd/yyyy"
     newsDateLabel.text = dateFormatter.string(from: publishedDate)
     
     */
    
    
    func cellEdit(newsList : BreakingNews) {
        searchCellTitle.text = newsList.title
        // Date Formating
        let publishedDate : Date = newsList.publishedAt as? Date ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM/dd/yyyy"
        searchCellSource.text = dateFormatter.string(from: publishedDate)
                
        if let url = URL(string: "\(newsList.urlToImage ?? "")"){
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
