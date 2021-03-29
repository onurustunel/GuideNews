//
//  FeedInterestCVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class FeedInterestCVC: UICollectionViewCell {
    
    @IBOutlet weak var interestCellimage: UIImageView!    
    @IBOutlet weak var interestCellTitle: UILabel!
    
    func cellEdit(newsList : BreakingNews) {
        interestCellTitle.text = newsList.title
        
        if let url = URL(string: "\(newsList.urlToImage ?? "")"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.interestCellimage.image = image
                    }
                }
                
            }
        }
    }
}
