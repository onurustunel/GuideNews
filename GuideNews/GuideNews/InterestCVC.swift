//
//  InterestCVC.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import UIKit

protocol AddInterestCollectionViewCellProtocol {
    func addYourInterest(indexPath:IndexPath)
}

class InterestCVC: UICollectionViewCell {
    
    @IBOutlet weak var interestName: UILabel!
    @IBOutlet weak var interestImage: UIImageView!
    @IBOutlet weak var followButton: UIButton!    
    
    var addInterestProtocol:AddInterestCollectionViewCellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func followClicked(_ sender: Any) {
        if followButton.titleLabel?.text == "Follow" {
            followButton.setTitle("Followed", for: .normal)
        }
        
        else  {
            followButton.setTitle("Follow", for: .normal)
        }
        addInterestProtocol?.addYourInterest(indexPath: indexPath!)
        
    }
    
    
}
