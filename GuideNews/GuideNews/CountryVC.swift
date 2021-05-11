//
//  CountryVC.swift
//  GuideNews
//
//  Created by MacOS on 11.04.2021.
//

import UIKit

class CountryVC: UIViewController {
    
    @IBOutlet weak var countryCollectionView: UICollectionView!
    var savedCountryData = UserDefaults.standard
    var chosenCountryArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryCollectionView.backgroundColor = .clear
        countryCollectionViewLayout()
        // Do any additional setup after loading the view.
    }
     
    
    func saveData() {
        savedCountryData.set(chosenCountryArray, forKey: "countryInfo")
    }
    

}

extension CountryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constant.countryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryCVC
 
        let name = Constant.countryName[indexPath.row]
        cell.countryName.text = "\(name)"
        cell.countryImage.image =  UIImage(named: "\(name)")
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenCountryArray.removeAll()
        chosenCountryArray.append(Constant.countryName[indexPath.row])
        saveData()
        print(chosenCountryArray.count)
        performSegue(withIdentifier: "toInterestVC", sender: next)
    }
    

    
}


extension CountryVC {
    
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
