//
//  InterestVC.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import UIKit

class InterestVC: UIViewController{
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    var interestData = InterestDataSet().interestData
    var interestArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestCollectionView.backgroundColor = .clear
        interestCollectionViewLayout()
        interestCollectionView.register(CollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewFooter.identifier)
        
    }
    
    func interestCollectionViewLayout() {
        let tasarim :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.interestCollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let hucreGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        interestCollectionView.collectionViewLayout = tasarim        
    }
}

extension InterestVC: UICollectionViewDelegate, UICollectionViewDataSource,  AddInterestCollectionViewCellProtocol, UICollectionViewDelegateFlowLayout, SaveInterestCollectionViewCellProtocol {
    
    
    func saveYourInterest() {
        print(interestArray)
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
