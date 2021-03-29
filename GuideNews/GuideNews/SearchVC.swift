//
//  SearchVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.backgroundColor = .clear
        searchbar()

        // Do any additional setup after loading the view.
    }
    
   
  

}

extension SearchVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTVC
        cell.searchCellimage.image = UIImage(named: "popular")
        cell.searchCellTitle.text = "asdada as dada a da da da adasa da adadad asd ad ada da ada ad adasad ad ad asdasdadsadsa ada a da da ad"
        cell.searchCellSource.text = "Source: newyorktimes.com"
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
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
