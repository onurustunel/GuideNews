//
//  GradientBackground.swift
//  GuideNews
//
//  Created by MacOS on 25.03.2021.
//

import Foundation
import UIKit

class BackgroundGradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]

        guard let theLayer = self.layer as? CAGradientLayer else {
            return;
        }
        let topColor : UIColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        let bottomColor : UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
         theLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
        theLayer.locations = [0.0, 1.0]
        
        theLayer.frame = self.bounds
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

