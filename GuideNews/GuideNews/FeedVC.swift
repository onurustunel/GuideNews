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
    var newsList : [BreakingNews]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Times New Roman", size: 20)!]
        
        backgroundCleaner()
        CollectionViewsLayout()        
        newsList = getPopularNewsResponse.getPopularNews()
        
        // Do any additional setup after loading the view.
    }
    
    func backgroundCleaner() {
        popularCollectionView.backgroundColor = .clear
        interestCollectionView.backgroundColor = .clear
        yesterdayCollectionView.backgroundColor = .clear
    }
    
    func CollectionViewsLayout() {
        popularCollecionView()
        detailCollectionView()
        yesterdayCollectionview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // code
        let index = sender as? Int
        
        if segue.identifier == "fromFeedtoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = newsList![index!]
        } 
    }
}


extension FeedVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularCollectionView {
            return newsList!.count
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
            var news = newsList![indexPath.row]
            cell.cellEdit(newsList: news) 
            return cell
            
        } else if collectionView == interestCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as! FeedInterestCVC
            cell.backgroundColor = .clear
            var news = newsList![indexPath.row]
            cell.cellEdit(newsList: news)
            return cell
            
        }  else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesterdayCell", for: indexPath) as! YesterdayCVC
            cell.backgroundColor = .clear            
            
            var news = newsList![indexPath.row]
            cell.cellEdit(newsList: news)
            return cell
            
            return cell
            
        }
     
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCollectionView {
            performSegue(withIdentifier: "toDetailNewsVC", sender: indexPath.row)
            
        }
    }
    
    
}
