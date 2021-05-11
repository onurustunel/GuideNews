//
//  CategoryCVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class CategoryCVC: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!    
    @IBOutlet weak var categoryName: UILabel!
    
    override func layoutSubviews() {
        categoryImage.AnimationFadein(startingAlpha: 0, duration: 2, curve: .curveEaseIn)
    }
    
}
