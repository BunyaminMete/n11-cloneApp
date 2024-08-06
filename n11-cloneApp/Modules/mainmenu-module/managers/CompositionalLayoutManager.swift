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
    case horizontalImageManuelSlider
    case horizontalProductSlider(hourlyOffer: String?)
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
        case .horizontalImageManuelSlider:
            return createHorizontalImageManuelSliderSection()
        case .horizontalProductSlider(let hourlyOffer):
            return createHorizontalProductSliderSection(hourlyOffer: hourlyOffer)
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
            largeItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
            
            let smallItemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(120))
            let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
            smallItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            
            let largeGroup = NSCollectionLayoutGroup.horizontal(layoutSize: largeItemSize, subitems: [largeItem])
            
            let smallGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(500), heightDimension: .absolute(120))
            let smallGroup = NSCollectionLayoutGroup.horizontal(layoutSize: smallGroupSize, subitems: [smallItem, smallItem, smallItem, smallItem, smallItem])
            
            let sectionGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(1200), heightDimension: .absolute(120))
            let sectionGroup = NSCollectionLayoutGroup.horizontal(layoutSize: sectionGroupSize, subitems: [largeGroup, smallGroup])
            
            let section = NSCollectionLayoutSection(group: sectionGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: -5, leading: 0, bottom: -10, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            section.decorationItems = [
                NSCollectionLayoutDecorationItem.background(elementKind: "background")
            ]
            
            return section
        }
    }
    
    private func createHorizontalImageSliderSection() -> NSCollectionLayoutSection {
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(175))
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.orthogonalScrollingBehavior = .paging
        
        return section
        
    }
    
    private func createHorizontalImageManuelSliderSection() -> NSCollectionLayoutSection {
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(100))
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 15, trailing: 20)
        
        section.orthogonalScrollingBehavior = .paging
        
        return section
        
    }
    
    private func createHorizontalProductSliderSection(hourlyOffer: String?) -> NSCollectionLayoutSection {
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.36), heightDimension: .absolute(290))
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        
        if let hourlyOffer = hourlyOffer, hourlyOffer != "" {
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.065)
            )
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top            )
            headerItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
            section.boundarySupplementaryItems = [headerItem]
        }
        
        
        section.orthogonalScrollingBehavior = .continuous
        section.decorationItems = [
            NSCollectionLayoutDecorationItem.background(elementKind: "lightbackground")
        ]
        
        return section
    }
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
        backgroundColor = UIColor(named: "purple11") // TopCategoryFilterCell setup for bgcolor
    }
}

class BackgroundLightView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "lightpurple11") // TopCategoryFilterCell setup for bgcolor
    }
}
