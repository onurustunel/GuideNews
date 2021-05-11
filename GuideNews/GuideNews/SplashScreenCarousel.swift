//
//  SplashScreenCarousel.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import Foundation
import ZKCarousel

class SplashScreenCarousel {
    
    static func setupCarousel() -> [ZKCarouselSlide] {
        
        let carousel: ZKCarousel! = ZKCarousel()
        
        // Create as many slides as you'd like to show in the carousel
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash1"),
                                     title: "Read All News Today",
                                     description: "Do not pay for fake news!")
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash2"),
                                     title: "News at Another Perspective",
                                     description: "We know what you are Searching...")
        let slide3 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash3"),
                                     title: "Leading The Way!!!",
                                     description: "Are you Missing Important?")
        let slide4 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash4"),
                                     title: "Power Your Future...",
                                     description: "A New Thinking, A New Thinking")
        let slide5 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash5"),
                                     title: "See Better Than Yesterday",
                                     description: "Reach all daily news wherever you are!")
        
        
        // Add the slides to the carousel
        carousel.slides = [slide1, slide2, slide3, slide4, slide5]
        return carousel.slides
        
        
    }
    
    
}


