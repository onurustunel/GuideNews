//
//  SearchVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    var newsList : [BreakingNews]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.backgroundColor = .clear
        searchbar()
        newsList = getPopularNewsResponse.getPopularNews()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        if segue.identifier == "fromSearchtoDetail" {
            
            let destinationVC = segue.destination as!  NewsDetailsVC
            destinationVC.breakingNews = newsList![index!]
        }
    }
    
   
    
}

extension SearchVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchTableView {
            return 20            
        } else {
            return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTVC
        
        let news = newsList![indexPath.row]
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
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchedWord = searchText
//        if searchText == "" {
//            childrenList =  companyList[0].children!
//            companyTableView.reloadData()
//
//        } else {
//            makeSearch(name: searchedWord)
//            print(childrenList.count)
//
//        }
// }

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
