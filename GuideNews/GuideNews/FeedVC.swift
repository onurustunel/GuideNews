//
//  FeedVC.swift
//  GuideNews
//
//  Created by MacOS on 26.03.2021.
//

import UIKit

class FeedVC: UIViewController {
    
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    @IBOutlet weak var yesterdayCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollecionView()
        popularCollectionView.backgroundColor = .clear
        interestCollectionView.backgroundColor = .clear
        yesterdayCollectionView.backgroundColor = .clear
        detailCollectionView()
        yesterdayCollectionview()
        
        // Do any additional setup after loading the view.
    }
    
     
}

extension FeedVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularCollectionView {
            return 10
        } else if collectionView == interestCollectionView {
            return 20
        } else {
            return 6
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularCVC
            cell.backgroundColor = .clear
            cell.popularCellimage.image = UIImage(named: "music")
            cell.popularCellTitle.text = "bir iki iasdad asdad ada da asdadsaddasdad asda adad ad ada dasdadadadadas"
            return cell
        } else if collectionView == interestCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as! FeedInterestCVC
            cell.backgroundColor = .clear
            cell.interestCellimage.image = UIImage(named: "popular")
            cell.interestCellTitle.text = "bir iki iasdad asdad ada da asdadsaddasdad asda adad ad ada dasdadadadadas"
            return cell
            
        }  else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesterdayCell", for: indexPath) as! YesterdayCVC
            cell.backgroundColor = .clear
            cell.yesterdayImage.image = UIImage(named: "economy")
            cell.yesterdayTitle.text = "bir iki iasdad asdad ada da asdadsaddasdad asda adad ad ada dasdadadadadas"
            return cell
            
        }
        
        
        
        
        
        
    }
    
    
}
