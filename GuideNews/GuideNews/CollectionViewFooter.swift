//
//  CollectionViewFooter.swift
//  GuideNews
//
//  Created by MacOS on 26.03.2021.
//

import UIKit

protocol SaveInterestCollectionViewCellProtocol {
    func saveYourInterest()
}

class CollectionViewFooter: UICollectionReusableView {
    
    static let identifier = "FooterCollectionView"
    var saveInterestProtocol:SaveInterestCollectionViewCellProtocol?
      
    private let button :UIButton = {
        let button = UIButton(type: .system) // let preferred over var here
        button.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.06274509804, blue: 0.01176470588, alpha: 1)
        button.setTitle(" Save ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 16)
        button.tintColor = .white
        button.addTarget(self, action: #selector(saveClicked), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()
    
    
    @objc func saveClicked(sender: UIButton!) {
        saveInterestProtocol?.saveYourInterest()
    }
    
    public func configure() {
        backgroundColor = .clear
        addSubview(button)
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        button.center = center
        button.frame = CGRect(x: bounds.width / 2 - 60 , y: bounds.height / 2 - 24 , width: 120, height: 38)
        
    }
}
