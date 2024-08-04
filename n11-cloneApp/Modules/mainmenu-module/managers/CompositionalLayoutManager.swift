//
//  CompositionalLayoutManager.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 3.08.2024.
//

import UIKit

enum LayoutType {
    case horizontal(isSlider: Bool)
    case horizontalImageSlider
    //    case normal(headerIdentifier: String?)
}

final class CompositionalLayoutManager {
    private init() {}
    
    static let sharedInstance = CompositionalLayoutManager()
    
    func createLayoutSection(layoutType: LayoutType) -> NSCollectionLayoutSection {
        switch layoutType {
        case .horizontal(let isSlider):
            return createHorizontalSection(isSlider: isSlider)
        case .horizontalImageSlider:
            return createHorizontalImageSliderSection()
            //        case .normal(let headerIdentifier):
            //            return createNormalSection(headerIdentifier: headerIdentifier)
        }
    }
    
    private func createHorizontalSection(isSlider: Bool) -> NSCollectionLayoutSection {
        if isSlider {
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            section.orthogonalScrollingBehavior = .continuous
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: "background")
            ]
            
            return section
        } else {
            let largeItemSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(120))
            let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
            largeItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            
            let smallItemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(120))
            let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
            smallItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            
            let largeGroup = NSCollectionLayoutGroup.horizontal(layoutSize: largeItemSize, subitems: [largeItem])
            
            let smallGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(500), heightDimension: .absolute(120))
            let smallGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallGroupSize, subitems: [smallItem, smallItem, smallItem, smallItem, smallItem])
            
            let sectionGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(1200), heightDimension: .absolute(120))
            let sectionGroup = NSCollectionLayoutGroup.horizontal(layoutSize: sectionGroupSize, subitems: [largeGroup, smallGroup])
            
            let section = NSCollectionLayoutSection(group: sectionGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: -5, leading: 20, bottom: -10, trailing: 20)
            section.orthogonalScrollingBehavior = .continuous
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: "background")
            ]
            
            return section
        }
    }
    
    private func createHorizontalImageSliderSection() -> NSCollectionLayoutSection {
        
//        / Yüksekliği 300 olacak ve dikey kaydırılacak bir section oluşturuyoruz
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(180))
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0) // Öğeler arasındaki boşluklar
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0) // Section içindeki boşluklar
        
        section.orthogonalScrollingBehavior = .paging // Dikey kaydırma davranışı
        
        return section
        
    }
    
    
    
    //    private func createNormalSection(headerIdentifier: String?) -> NSCollectionLayoutSection {
    //        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
    //        let item = NSCollectionLayoutItem(layoutSize: itemSize)
    //
    //        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .absolute(270))
    //        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    //
    //        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
    //
    //        let section = NSCollectionLayoutSection(group: group)
    //        section.orthogonalScrollingBehavior = .groupPaging
    //
    //        if let headerIdentifier = headerIdentifier, headerIdentifier != "" {
    //            section.boundarySupplementaryItems = [
    //                .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    //            ]
    //        }
    //        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 40, trailing: 15)
    //
    //        return section
    //    }
}


class BackgroundView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "purple11") // Arka plan rengini burada ayarlayın
    }
}
