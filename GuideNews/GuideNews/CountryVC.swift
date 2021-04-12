//
//  CountryVC.swift
//  GuideNews
//
//  Created by MacOS on 11.04.2021.
//

import UIKit

class CountryVC: UIViewController {
    
    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryCollectionView.backgroundColor = .clear
        countryCollectionViewLayout()

        // Do any additional setup after loading the view.
    }
    
    func countryCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.countryCollectionView.collectionViewLayout = layout
        self.countryCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        if let layout = self.countryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width - 10 , height: self.view.frame.size.width - 120)
            layout.invalidateLayout()
        }
    }
    

}

extension CountryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
//    func saveYourInterest() {
//        saveData()
//
//        if interestArray.count > 0 {
//            let storyboard: UIStoryboard = UIStoryboard(name: "Feed", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "Feed") as! FeedTabBarController
//            self.show(vc, sender: self)
//        }
//    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constant.countryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryCVC
//        var data = interestData[indexPath.row]
        let name = Constant.countryName[indexPath.row]
        cell.countryName.text = "\(name)"
        cell.countryImage.image =  UIImage(named: "\(name)")
        
        cell.backgroundColor = .clear
      
        return cell
    }
    

    
}
