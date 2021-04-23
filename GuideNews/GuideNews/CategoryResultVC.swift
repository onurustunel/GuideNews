//
//  CategoryResultVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class CategoryResultVC: UIViewController {
    
    @IBOutlet weak var categoryResultTableView: UITableView!
    var chosenCategory = ""
    var categoryNews : [BreakingNews]?
    var filteredNews : [BreakingNews]?
    var allNews : [BreakingNews]?
    var searchedWord = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryResultTableView.backgroundColor = .clear
        searchbar()
        self.categoryNews = GetCategoryNews.getCategoryNews(category: self.chosenCategory)
        navigationItem.title = chosenCategory
        allNews = categoryNews
        
       
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "fromCategorytoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = categoryNews![index!]
        }
    }
    func makeSearch(name: String) {
        var filteredList = categoryNews!.filter({$0.title!.lowercased().contains(name.lowercased())})
        categoryNews = filteredList
        
        DispatchQueue.main.async {
            self.categoryResultTableView.reloadData()
        }
    }
    
    
}


extension CategoryResultVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNews?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryResult", for: indexPath) as! CategoryResultTVC
        let news = categoryNews![indexPath.row]
        cell.cellEdit(newsList: news)
        
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromCategorytoDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    
}

extension CategoryResultVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        searchedWord = searchText
        if searchText == "" {
            categoryNews =  allNews
            categoryResultTableView.reloadData()
            
        } else {
            makeSearch(name: searchedWord)
            
        }
    }

}


extension CategoryResultVC {
    
    func searchbar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.tintColor = .white
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.backgroundColor = .clear
        searchBar.placeholder = " Search Here..."
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
        categoryResultTableView.tableHeaderView = searchBar
    }

}
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
