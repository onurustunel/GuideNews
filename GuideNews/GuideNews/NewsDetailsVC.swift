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
        configureView()
        
        animation()
         
    }
    
    
    func animation() {
        newsImage.AnimationFadein(startingAlpha: 0.3, duration: 1.5, curve: .curveEaseIn) 
    }
    
    
    func configureView() {
        if let news = breakingNews {
            newsTitleLabel.text = news.title
            newsDetailText.text = news.description
            let date = "\(news.publishedAt?.prefix(10) ?? "")"
            newsDateLabel.text = Helper.changeDateFormat(dateString: date, fromFormat: "yyyy-MM-dd", toFormat: "dd/MM/yyyy")
            
            
            if let url = URL(string: "\(news.urlToImage ?? "")"){
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
    
    
    @IBAction func shareClicked(_ sender: Any) {
        print(breakingNews?.url ?? "")
        let activityVC = UIActivityViewController(activityItems: [breakingNews?.url ?? ""], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    
    @IBAction func detailsClicked(_ sender: Any) {
        if let link = breakingNews?.url {
            if let url = URL(string : "\(link)") {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
}
