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
        
        var carousel: ZKCarousel! = ZKCarousel()
        
        // Create as many slides as you'd like to show in the carousel
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash1"),
                                     title: "Read the World Today",
                                     description: "Do not pay for paid news!")
        let slide2 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash2"),
                                     title: "News at Another Perspective",
                                     description: "We know what you are Searching...")
        let slide3 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash3"),
                                     title: "Leading the way!!!",
                                     description: "Are you Missing Important?")
        let slide4 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash4"),
                                     title: "Power your Future...",
                                     description: "A New Thinking, A New Thinking, A New Thinking, A New Thinking, A New Thinking")
        let slide5 = ZKCarouselSlide(image: #imageLiteral(resourceName: "splash5"),
                                     title: "See Better Than Yesterday",
                                     description: "Reach every people, in nominal value, Reach every people, in nominal value, Reach every people, in nominal value, Reach every people, in nominal value!!!")
        
        
        // Add the slides to the carousel
        carousel.slides = [slide1, slide2, slide3, slide4, slide5]
        return carousel.slides
        
        // You can optionally use the 'interval' property to set the timing for automatic slide changes. The default is 1 second.
        //        self.carousel.interval = 4.0
        
        // OPTIONAL - use this function to automatically start traversing slides.
        //        self.carousel.start()
        
        // OPTIONAL - use this function to stop automatically traversing slides.
        // self.carousel.stop()
    }
    
    
}


