//
//  GetSearchedNews.swift
//  GuideNews
//
//  Created by MacOS on 29.03.2021.
//

import Foundation

class GetSearchedNews {
    
    static func getSearchedNews(searchedText : String) -> [BreakingNews] {
        
        var searchedNews : [BreakingNews]?
        
        var semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(searchedText)&sortBy=popularity&apiKey=\(Constant.SECONDAPIKEY)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          
            guard let httpResponse  = response as? HTTPURLResponse else {
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                guard let data = data else {
                    print(String(describing: error))
                    semaphore.signal()
                    return
                }
                
                do{
                    if let jsonPetitions = try? JSONDecoder().decode(BreakingNewsResult.self, from: data) {
                        searchedNews = jsonPetitions.articles!
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
                semaphore.signal()
            }
        }
        task.resume()
        semaphore.wait()
        return searchedNews!
    }
    
}
