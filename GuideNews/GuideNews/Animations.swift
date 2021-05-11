//
//  Animations.swift
//  GuideNews
//
//  Created by MacOS on 5.05.2021.
//

import UIKit

extension UIView {
    
    func AnimationFadein(startingAlpha: CGFloat , duration: Double, curve : AnimationOptions) {
        self.alpha = startingAlpha
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: curve) {
            self.alpha = 1
        }
    }
    
    func AnimationFadeOut(duration: Double, curve : AnimationOptions) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: curve) {
            self.alpha = 0
        }
    }
    
    
    func AnimationScale(scale : CGFloat, duration : Double, curve : AnimationOptions) {
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: curve, animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }
    
    func AnimationTransform (duration : Double , X : CGFloat , Y : CGFloat , curve : AnimationOptions  ) {
        self.transform = CGAffineTransform(translationX: X, y: Y)
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: curve ,animations: {
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }
    
}

extension UIView {
    func roundView ( radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
