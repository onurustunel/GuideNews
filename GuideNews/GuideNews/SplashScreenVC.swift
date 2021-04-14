//
//  ViewController.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import UIKit
import ZKCarousel

class SplashScreenVC: UIViewController {
    
    @IBOutlet weak var carousel: ZKCarousel! = ZKCarousel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.slides = SplashScreenCarousel.setupCarousel()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
                     
    }

    @IBAction func interestButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toCountryVC", sender: nil)
    }
    
    
    


}

