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
    let interestData : [Interests] = [Interests(name: "ART", image: UIImage(named: "art")!),
                                      Interests(name: "BEAUTY", image: UIImage(named: "beauty")!),
                                      Interests(name: "BUSINESS", image: UIImage(named: "business")!),
                                      Interests(name: "CAR", image: UIImage(named: "car")!),
                                      Interests(name: "CINEMA", image: UIImage(named: "cinema")!),
                                      Interests(name: "CULTURE", image: UIImage(named: "culture")!),
                                      Interests(name: "ECONOMY", image: UIImage(named: "economy")!),
                                      Interests(name: "ENTERTAINMENT", image: UIImage(named: "entertainment")!),
                                      Interests(name: "FASHION", image: UIImage(named: "fashion")!),
                                      Interests(name: "MUSIC", image: UIImage(named: "music")!),
                                      Interests(name: "POLITICS", image: UIImage(named: "politics")!),
                                      Interests(name: "POPULAR", image: UIImage(named: "popular")!),
                                      Interests(name: "SCIENCE", image: UIImage(named: "science")!),
                                      Interests(name: "SPORT", image: UIImage(named: "sport")!),
                                      Interests(name: "TECHNOLOGY", image: UIImage(named: "technology")!),
                                      Interests(name: "TRAVEL", image: UIImage(named: "travel")!)
                                      
    ]
}

   


