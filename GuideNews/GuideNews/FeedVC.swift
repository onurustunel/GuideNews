//
//  FeedVC.swift
//  GuideNews
//
//  Created by MacOS on 26.03.2021.
//

import UIKit


class FeedVC: UIViewController {
    
    
    @IBOutlet weak var specialCategories: UILabel!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    @IBOutlet weak var yesterdayCollectionView: UICollectionView!
    var newsList : [BreakingNews]?
    var searchedList : [BreakingNews]?
    var yesterdayList : [BreakingNews]?
    var savedDataControl = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedInterest = savedDataControl.array(forKey: "savedInterests") as? [String]  {
            print(savedInterest.count, "adet categori bulundu")
            let random =  Int(arc4random_uniform(UInt32(savedInterest.count)))
            specialCategories.text = savedInterest[random]
            
            
            searchedList = GetCategoryNews.getCategoryNews(category: savedInterest[random])
            print("data \(savedInterest[random]) hakkında yazıların getirilmesi gerekiyor...")
        }
        
        backgroundCleaner()
        CollectionViewsLayout()        
        newsList = getPopularNewsResponse.getPopularNews()
//        searchedList = GetSearchedNews.getSearchedNews(searchedText: "apple")
        yesterdayList = GetYesterdayNews.getYesterdayNews()
//      GetSearchedNews.getSearchedNews(searchedText: "tesla")
        
        
        
        // Do any additional setup after loading the view.
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
    
    
    @IBAction func settingsClicked(_ sender: Any) {
//        let alert = UIAlertController(title: "Setting", message: "Are you sure to change your personal settings?", preferredStyle: .alert)
//        let yesButton = UIAlertAction(title: "Yes", style: .default) { (action) in
//            self.newsList!.removeAll()
//            self.searchedList!.removeAll()
//            self.yesterdayList!.removeAll()
//            
//            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "Main") as! SplashScreenVC
//            self.show(vc, sender: self)
//        }
//        yesButton.setValue(UIColor.red, forKey: "titleTextColor")
//        let noButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
//        noButton.setValue(UIColor.red, forKey: "titleTextColor")
//        alert.addAction(yesButton)
//        alert.addAction(noButton)
//        present(alert, animated: true, completion: nil)
    }
    // fromYesterdayFeedtoDetail
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // code
        let index = sender as? Int
               
        if segue.identifier == "fromPopularFeedtoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = newsList![index!]
        } else  if segue.identifier == "fromInterestFeedtoDetail" {
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = searchedList![index!]
        } else if segue.identifier == "fromYesterdayFeedtoDetail" {
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = yesterdayList![index!]
        }
        // fromInterestFeedtoDetail
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
            var news = searchedList![indexPath.row]
            cell.cellEdit(newsList: news)
            return cell
            
        }  else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yesterdayCell", for: indexPath) as! YesterdayCVC
            cell.backgroundColor = .clear
            
            var news = yesterdayList![indexPath.row]
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
