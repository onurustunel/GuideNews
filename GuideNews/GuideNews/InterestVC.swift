//
//  InterestVC.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import UIKit

class InterestVC: UIViewController{
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    var interestData = InterestDataSet().categoriesData
    var interestArray = [String]()
    var savingData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestCollectionView.backgroundColor = .clear
        interestCollectionViewLayout()
        interestCollectionView.register(CollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewFooter.identifier)
        
        print(Language.ChosenLanguage(), "dilinde seçim yapıldı...")
        
        
    }
    
    
    
    
    func interestCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.interestCollectionView.collectionViewLayout = layout
        self.interestCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        if let layout = self.interestCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 10 , height: self.view.frame.size.width / 2 - 10)
            layout.invalidateLayout()
        }
    }
    
    
    
    
//    func interestCollectionViewLayout() {
//        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        let width = self.interestCollectionView.frame.size.width
//        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        let cellWidth = (width-30)/2
//        design.itemSize = CGSize(width: cellWidth, height: cellWidth)
//        design.minimumInteritemSpacing = 10
//        design.minimumLineSpacing = 10
//        interestCollectionView.collectionViewLayout = design
//    }
    
    
    func saveData() {
        
        
        savingData.set(interestArray, forKey: "savedInterests")
    }
       
}

extension InterestVC: UICollectionViewDelegate, UICollectionViewDataSource,  AddInterestCollectionViewCellProtocol, UICollectionViewDelegateFlowLayout, SaveInterestCollectionViewCellProtocol {
    
    
    func saveYourInterest() {
        saveData()
        
        if interestArray.count > 0 {
            let storyboard: UIStoryboard = UIStoryboard(name: "Feed", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Feed") as! FeedTabBarController
             self.show(vc, sender: self)
        }
    }
    
    func addYourInterest(indexPath: IndexPath) {
        var data = interestData[indexPath.row].name
        
        if interestArray.contains(data) {
            if let index = interestArray.firstIndex(of: data) {
                interestArray.remove(at: index)
            }
           
        } else {
            interestArray.append(data)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCVC
        var data = interestData[indexPath.row]
        cell.interestName.text = data.name
        cell.interestImage.image = data.image
        
        cell.backgroundColor = .clear        
        cell.addInterestProtocol = self
        cell.indexPath = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewFooter.identifier, for: indexPath) as! CollectionViewFooter
        footer.saveInterestProtocol = self
        footer.configure()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 120 , height: 60)
    }
    
}
