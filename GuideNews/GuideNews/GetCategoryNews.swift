//
//  GetCategoryNewsMVVM.swift
//  GuideNews
//
//  Created by MacOS on 9.05.2021.
//

import Foundation

class GetCategoryNews {
    
    
    func getCategoryNews(category: String, completion: @escaping ([BreakingNews]?) -> ()) {
        let chosenLanguage = Language.ChosenLanguage()
        
        let request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(chosenLanguage)&category=\(category)&apiKey=\(Constant.APIKEY)")!,timeoutInterval: Double.infinity)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse  = response as? HTTPURLResponse else {
                return
            }
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    
                    let newsList = try? JSONDecoder().decode(BreakingNewsResult.self, from: data)
                    
                    if let newsList = newsList {
                        completion(newsList.articles)
                    }
                    
                }
            }
           
            
        }.resume()
        
    }
    
    
  
    
}
