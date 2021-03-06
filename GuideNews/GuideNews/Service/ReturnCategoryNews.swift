//
//  GetCategoryNews.swift
//  GuideNews
//
//  Created by MacOS on 30.03.2021.
//

import Foundation

class ReturnCategoryNews {
    
    static func returnCategoryNews(category : String) -> [BreakingNews] {
        let chosenLanguage = Language.ChosenLanguage()
        
        var categoryNews : [BreakingNews]?
        let semaphore = DispatchSemaphore (value: 0)
         
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(chosenLanguage)&category=\(category)&apiKey=\(Constant.APIKEY)")!,timeoutInterval: Double.infinity)


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
                    if let jsonData = try? JSONDecoder().decode(BreakingNewsResult.self, from: data) {
                        categoryNews = jsonData.articles!
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
        return categoryNews!
    }
    
}
