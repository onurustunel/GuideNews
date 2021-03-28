//
//  FeedLayoutExtention.swift
//  GuideNews
//
//  Created by MacOS on 28.03.2021.
//

import UIKit

extension FeedVC {
    
    
    func popularCollecionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.popularCollectionView.collectionViewLayout = layout
        self.popularCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        
        if let layout = self.popularCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width-80, height: self.view.frame.size.width-80)
            layout.invalidateLayout()
        }
        
        
    }
    
    func yesterdayCollectionview() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.yesterdayCollectionView.collectionViewLayout = layout
        self.yesterdayCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        if let layout = self.yesterdayCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width-140, height: self.view.frame.size.width-140)
            layout.invalidateLayout()
        }
        
        
    }
    
    
    func detailCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.interestCollectionView.collectionViewLayout = layout
        self.interestCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 5, bottom:10, right: 5)
        
        if let layout = self.interestCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 20 , height: self.view.frame.size.width / 2 - 20)
            layout.invalidateLayout()
        }
    }
    
    
    
    
}
