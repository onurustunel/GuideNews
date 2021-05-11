//
//  PopularCVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class PopularCVC: UICollectionViewCell {
    
    @IBOutlet weak var popularCellimage: UIImageView!
    
    @IBOutlet weak var popularCellTitle: UILabel!
    
    
    func cellEdit(newsList : BreakingNews) {
        popularCellTitle.text = newsList.title
        popularCellimage.AnimationFadein(startingAlpha: 0, duration: 3, curve: .curveLinear)
        
        if let url = URL(string: "\(newsList.urlToImage ?? "")"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data ?? Data()) {
                        self.popularCellimage.image = image
                    }
                }                
            }
        }
    }
    
    
}
