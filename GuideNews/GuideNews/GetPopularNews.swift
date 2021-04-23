//
//  GetPopularNews.swift
//  GuideNews
//
//  Created by MacOS on 29.03.2021.
//

import Foundation

class getPopularNewsResponse {
    
    static func getPopularNews() -> [BreakingNews] {
        let chosenLanguage = Language.ChosenLanguage()
        
        var newsList : [BreakingNews]?
        
        var semaphore = DispatchSemaphore (value: 0)
        

        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(chosenLanguage)&apiKey=\(Constant.SECONDAPIKEY)")!,timeoutInterval: Double.infinity)


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
                        newsList = jsonPetitions.articles!
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
        return newsList!
    }
    
}
