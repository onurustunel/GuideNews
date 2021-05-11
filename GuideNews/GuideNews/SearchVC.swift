//
//  SearchVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    var newsList = [BreakingNews]()
 
    
    func getSearchedNews(searchedText : String) {
        let request =  URL(string: "https://newsapi.org/v2/everything?q=\(searchedText)&sortBy=popularity&apiKey=\(Constant.APIKEY)")!
       print(request)
        GetSearchedNews().getSearchedNews(searchedText: searchedText) { (news) in
            if let news = news {
                self.newsList = news
                DispatchQueue.main.async {
                    self.searchTableView.reloadData()
                }
            }
            }
            
    }
    
    func getPopularNews() {
        
        GetPopularNews().getPopularNews() {[weak self] (popularNews) in
            if let popularNews = popularNews {
                self?.newsList = popularNews
                DispatchQueue.main.async {
                    self?.searchTableView.reloadData()
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.backgroundColor = .clear
        searchbar()
        getPopularNews()

        self.hideKeyboardWhenTappedAround()
 
        searchTableView.reloadData()
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "fromSearchtoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = newsList[index!]
        }
    }
    
   
    
}

extension SearchVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newsList.count > 0 { return newsList.count  } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTVC
        
        let news = newsList[indexPath.row]
        cell.cellEdit(newsList: news)        
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromSearchtoDetail", sender: indexPath.row)
    }
     
    
}

extension SearchVC: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            getPopularNews()
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         let text = searchBar.searchTextField.text
          
        
        newsList.removeAll()
        getSearchedNews(searchedText: text ?? "")
        
        view.endEditing(true)
        
    }
 

}


extension SearchVC {
    
    func searchbar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.tintColor = .white
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.backgroundColor = .clear
        searchBar.placeholder = " Search Here..."
        searchBar.showsCancelButton = false
        searchBar.sizeToFit()
        searchTableView.tableHeaderView = searchBar
    }

}
