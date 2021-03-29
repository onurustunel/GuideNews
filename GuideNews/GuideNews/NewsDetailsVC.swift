//
//  NewsDetailsVC.swift
//  GuideNews
//
//  Created by MacOS on 29.03.2021.
//

import UIKit

class NewsDetailsVC: UIViewController {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDetailText: UITextView!
    
    var breakingNews : BreakingNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view()
       
        

        // Do any additional setup after loading the view.
    }
    
    
    func view() {
        if let news = breakingNews {
            newsTitleLabel.text = news.title
            newsDateLabel.text = news.publishedAt
            newsDetailText.text = news.description
            
            if let url = URL(string: "\(news.urlToImage!)"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        if let image = UIImage(data: data ?? Data()) {
                            self.newsImage.image = image
                        }
                    }                                        
                }
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func detailsClicked(_ sender: Any) {
        
        // segue to Safari
        
    }
    
}
