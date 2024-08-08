//
//  CompositionalLayoutProductDetailManager.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 8.08.2024.
//

import UIKit

class CompositionalLayoutProductDetailManager{
    
    static let sharedInstance = CompositionalLayoutProductDetailManager()
    
    func createTopProductImageLayout() -> NSCollectionLayoutSection {
        // Item boyutu (her hücrenin genişliği %25 ve yüksekliği sabit)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.85))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0) // Hücreler arasındaki boşluk
        
        // Grup boyutu (her satırda 1 hücre olacak)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.85))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging // Kaydırma yok
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0) // Section içi boşluk
        
        return section
    }
    
    
    func createMiniProductFeaturesViewLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
        
    }
}

