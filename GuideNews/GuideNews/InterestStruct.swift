//
//  InterestStruct.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import UIKit


struct Interests {
    var name : String
    var image : UIImage
}

class InterestDataSet {
    
    
    let categoriesData : [Interests] = [Interests(name: "BUSINESS",
                                                  image: UIImage(named: "business")!),
                                        Interests(name: "ENTERTAINMENT", image: UIImage(named: "entertainment")!),
                                        Interests(name: "GENERAL", image: UIImage(named: "popular")!),
                                        Interests(name: "HEALTH", image: UIImage(named: "beauty")!),
                                        Interests(name: "SCIENCE", image: UIImage(named: "science")!),
                                        Interests(name: "SPORTS", image: UIImage(named: "sport")!),
                                        Interests(name: "TECHNOLOGY", image: UIImage(named: "technology")!),
    ]
}

   


