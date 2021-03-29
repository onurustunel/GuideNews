//
//  CategoryResultVC.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

class CategoryResultVC: UIViewController {
    
    
    
    @IBOutlet weak var categoryResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryResultTableView.backgroundColor = .clear
        searchbar()
        // Do any additional setup after loading the view.
    }
    

   

}


extension CategoryResultVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryResult", for: indexPath) as! CategoryResultTVC
        cell.categoryResultimage.image = UIImage(named: "popular")
        cell.categoryResultTitle.text = "asdada as dada a da da da adasa da adadad asd ad ada da ada ad adasad ad ad asdasdadsadsa ada a da da ad"
        cell.categoryResultSource.text = "Source: newyorktimes.com"
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
}

extension CategoryResultVC: UISearchBarDelegate {
    
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
