//
//  BreakingNews.swift
//  GuideNews
//
//  Created by MacOS on 29.03.2021.
//

import Foundation

class BreakingNews : Codable {
   
    
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    
    internal init(author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    
}


class BreakingNewsResult :Codable {
        var articles: [BreakingNews]?
    
}
