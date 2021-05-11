//
//  PersonalNews.swift
//  GuideNews
//
//  Created by MacOS on 6.05.2021.
//

import UIKit

class PersonalNews: UIViewController {

    var savedDataControl = UserDefaults.standard
    var personalNews = [BreakingNews]()
    @IBOutlet weak var personalNewsTableView: UITableView!
    var pageNumber = 1
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let savedInterest = savedDataControl.array(forKey: "savedInterests") as? [String]  {
           
            DispatchQueue.main.async {
                self.getInterestNews(category: savedInterest[0])
             }
        }
        
        
    }
    
    
    func getInterestNews(category: String ) {
        
        GetCategoryNews().getCategoryNews(category: category) {[weak self] (categoryNews) in
            if let categoryNews = categoryNews {
                self?.personalNews = categoryNews
                DispatchQueue.main.async {
                   
                    self?.personalNewsTableView.reloadData()
                }
            }
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "fromPersonalNewstoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = personalNews[index!]
        }
    }
  
}

extension PersonalNews: UITableViewDelegate, UITableViewDataSource {
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let savedInterest = savedDataControl.array(forKey: "savedInterests") as! [String]
        if pageNumber < savedInterest.count {
            
            if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height {
                
                let update = ReturnCategoryNews.returnCategoryNews(category: savedInterest[pageNumber])
                personalNews.append(contentsOf: update)
                pageNumber += 1
                DispatchQueue.main.async {
                    self.personalNewsTableView.reloadData()
                }
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if personalNews.count > 0 {
            return personalNews.count
        } else {  return 0 }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalNewsCell") as! PersonalNewsTVC
        let newsData = personalNews[indexPath.row]
        cell.cellEdit(newsList: newsData)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromPersonalNewstoDetail", sender: indexPath.row)
    }
    
    
}
