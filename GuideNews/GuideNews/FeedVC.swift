//
//  FeedVC.swift
//  GuideNews
//
//  Created by MacOS on 26.03.2021.
//

import UIKit


class FeedVC: UIViewController {
    
    
    @IBOutlet weak var specialCategories: UILabel!
    
    @IBOutlet weak var secondSpecialCategories: UILabel!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    @IBOutlet weak var yesterdayCollectionView: UICollectionView!
    
    var newsList = [BreakingNews]()
    var searchedList = [BreakingNews]()
    var yesterdayList = [BreakingNews]()
    var savedDataControl = UserDefaults.standard
    
   
    @IBOutlet var mainView: BackgroundGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPopularNews()
     
        
        if let savedInterest = savedDataControl.array(forKey: "savedInterests") as? [String] {
          
          
            let random =  Int(arc4random_uniform(UInt32(savedInterest.count)))
            
            var random2 : Int
            repeat {
                random2 = Int(arc4random_uniform(UInt32(savedInterest.count)))
            } while random == random2
             
            specialCategories.text = savedInterest[random]
            secondSpecialCategories.text = savedInterest[random2]
            
            getCategoryNews(category: savedInterest[random])
            getSecondRandomCategoryNews(category: savedInterest[random2])
         
            
        }
        
        backgroundCleaner()
        CollectionViewsLayout()        
        
    }
    
    
    func getCategoryNews(category: String ) {
        
        GetCategoryNews().getCategoryNews(category: category) {[weak self] (categoryNews) in
            if let categoryNews = categoryNews {
                self?.searchedList = categoryNews
                DispatchQueue.main.async {
                    
                    self?.interestCollectionView.reloadData()
                }
            }
        }
        
    }

    func getSecondRandomCategoryNews(category: String ) {
        
        GetCategoryNews().getCategoryNews(category: category) {[weak self] (categoryNews) in
            if let categoryNews = categoryNews {
                self?.yesterdayList = categoryNews
                DispatchQueue.main.async {
                   
                    self?.yesterdayCollectionView.reloadData()
                }
            }
        }
    }
    
    
    func getPopularNews() {
        
        GetPopularNews().getPopularNews() {[weak self] (popularNews) in
            if let popularNews = popularNews {
                self?.newsList = popularNews
                DispatchQueue.main.async {
                    print("")
                    self?.popularCollectionView.reloadData()
                }
            }
        }
        
    }
    
    
    @IBAction func searchClicked(_ sender: Any) {
        tabBarController?.selectedIndex = 1
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
       
        let index = sender as? Int
               
        if segue.identifier == "fromPopularFeedtoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = newsList[index!]
        } else  if segue.identifier == "fromInterestFeedtoDetail" {
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = searchedList[index!]
        } else if segue.identifier == "fromYesterdayFeedtoDetail" {
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = yesterdayList[index!]
        }
        
    }
    
}


extension FeedVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularCollectionView {
            if newsList.count > 0 {
              return  newsList.count
            }
            return 0
        }
        else if collectionView == interestCollectionView {
            if searchedList.count > 0 {
              return  12
            }
            return 0
        } else {
            if yesterdayList.count > 0 {
              return  6
            }
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularCVC
            cell.backgroundColor = .clear
            let news = newsList[indexPath.row]
            cell.cellEdit(newsList: news) 
            return cell
            
        } else if collectionView == interestCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as! FeedInterestCVC
            cell.backgroundColor = .clear
            let news = searchedList[indexPath.row]
            cell.cellEdit(newsList: news)
            return cell
            
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesterdayCell", for: indexPath) as! YesterdayCVC
            cell.backgroundColor = .clear
            
            let news = yesterdayList[indexPath.row]
            cell.cellEdit(newsList: news)
            return cell
            
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCollectionView {
            performSegue(withIdentifier: "fromPopularFeedtoDetail", sender: indexPath.row)
            
        } else  if collectionView == interestCollectionView {
            performSegue(withIdentifier: "fromInterestFeedtoDetail", sender: indexPath.row)
            
        } else if collectionView == yesterdayCollectionView {
            performSegue(withIdentifier: "fromYesterdayFeedtoDetail", sender: indexPath.row)
        }
    }
    
    
}
