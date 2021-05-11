//
//  CategoryVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categoryData = InterestDataSet().categoriesData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.backgroundColor = .clear
        categoryCollectionViewLayout()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "toCategoryResult" {
            
            let destinationVC = segue.destination as! CategoryResultVC
            destinationVC.chosenCategory = categoryData[index!].name
            
        }
    }
    
    func categoryCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.categoryCollectionView.collectionViewLayout = layout
        self.categoryCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        if let layout = self.categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 10 , height: self.view.frame.size.width / 2 - 10)
            layout.invalidateLayout()
        }
    }
   
}

extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCVC
        let data = categoryData[indexPath.row]
        
        cell.categoryImage.image = data.image
        cell.categoryName.text = data.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCategoryResult", sender: indexPath.row)
    }
    
    
}
