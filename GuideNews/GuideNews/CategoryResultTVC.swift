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

    func cellEdit(newsList : BreakingNews) {
        categoryResultTitle.text = newsList.title
        // Date Formating
        let publishedDate : Date = newsList.publishedAt as? Date ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM/dd/yyyy"
        categoryResultSource.text = dateFormatter.string(from: publishedDate)
        
        // Image Downloading
        
        if let url = URL(string: "\(newsList.urlToImage ?? "")"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.categoryResultimage.image = image
                    }
                }
                
                
            }
        }
    }
}
