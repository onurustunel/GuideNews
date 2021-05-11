//
//  PersonalNewsTVC.swift
//  GuideNews
//
//  Created by MacOS on 6.05.2021.
//

import UIKit

class PersonalNewsTVC: UITableViewCell {
    @IBOutlet weak var personalNewsImage: UIImageView!
    
    @IBOutlet weak var personalNewsTitle: UILabel!
    
    @IBOutlet weak var personalNewsDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellEdit(newsList : BreakingNews) {
        personalNewsTitle.text = newsList.title
        
        // Date Formating
        
        let date = "\(newsList.publishedAt?.prefix(10) ?? "")"
        personalNewsDate.text = Helper.changeDateFormat(dateString: date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy")
        
        // Image Downloading
        
        if let url = URL(string: "\(newsList.urlToImage ?? "")"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.personalNewsImage.image = image
                    }
                }
                 
            }
        }
    }

}
