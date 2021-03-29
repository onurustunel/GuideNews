//
//  YesterdayCVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class YesterdayCVC: UICollectionViewCell {
    @IBOutlet weak var yesterdayImage: UIImageView!
    @IBOutlet weak var yesterdayTitle: UILabel!
    
    func cellEdit(newsList : BreakingNews) {
        yesterdayTitle.text = newsList.title
        
        if let url = URL(string: "\(newsList.urlToImage!)"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.yesterdayImage.image = image
                    }
                }
                
                
            }
        }
    }
    
    
    
}
