//
//  GetSearchedNewsMVVM.swift
//  GuideNews
//
//  Created by MacOS on 9.05.2021.
//

import Foundation

class GetSearchedNews {
    
    func getSearchedNews(searchedText: String, completion: @escaping ([BreakingNews]?) -> ()) {
        let request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(searchedText)&sortBy=popularity&apiKey=\(Constant.APIKEY)")!,timeoutInterval: Double.infinity)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            guard let httpResponse  = response as? HTTPURLResponse else {
                return
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

