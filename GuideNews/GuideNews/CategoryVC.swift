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
        print(categoryData[0].name)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "toCategoryResult" {
            
            let destinationVC = segue.destination as! CategoryResultVC
            destinationVC.chosenCategory = categoryData[index!].name
            
        }
    }
    
    
    
    func categoryCollectionViewLayout() {
        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.categoryCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width-30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        categoryCollectionView.collectionViewLayout = design
    }
    

  

}
extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCVC
        var data = categoryData[indexPath.row]
        
        cell.categoryImage.image = data.image
        cell.categoryName.text = data.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCategoryResult", sender: indexPath.row)
    }
    
    
}
