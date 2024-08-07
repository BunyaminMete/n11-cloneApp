//
//  MainMenuPresenter.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import UIKit

final class MainPagePresenter: MainPageInteractorOutput {
    var interactor: MainPageInteractor?
    weak var view: MainPageViewController?

    func startSlider() {
        interactor?.startSliderTimer()
    }

    func stopSlider() {
        interactor?.stopSliderTimer()
    }

    func numberOfItemsInSliderSection() -> Int {
        return view?.numberOfItemsInSliderSection() ?? 0
    }

    func scrollToItem(at index: Int) {
        view?.scrollToItem(at: index)
    }

    func getSectionsCount() -> Int {
        return interactor?.getSectionsCount() ?? 0
    }

    func getNumberOfItems(in section: Int) -> Int {
        return interactor?.getSectionsCount() ?? 0
    }

    func getCell(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let section = interactor?.getSection(at: indexPath.section)
        let item = section?.getItem(at: indexPath.row)
        switch section?.cellType {
        case .filterCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! TopCategoryCollectionViewCell
            if let filterModel = item as? TopCategoryFilterCellModel {
                cell.setup(model: filterModel)
            }
            return cell
        case .imageSliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageSliderCollectionViewCell
            if let sliderModel = item as? ImageSliderCellModel {
                cell.configureSlidedImage(with: sliderModel)
            }
            return cell
        case .imageManuelSliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ManuelSliderCollectionViewCell.reuseIdentifier, for: indexPath) as! ManuelSliderCollectionViewCell
            if let manuelSliderModel = item as? ImageManuelSliderCellModel {
                cell.configureManuelSlider(with: manuelSliderModel)
            }
            return cell
        case .productSliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCardCollectionViewCell
            if let productModel = item as? ProductCardCellModel {
                cell.configureProductCard(with: productModel)
            }
            return cell
        default:
            fatalError("Unhandled cell type")
        }
    }

    func getHeaderView(for kind: String, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductCardHeaderReusableView.headerIdentifier, for: indexPath) as! ProductCardHeaderReusableView
            return headerView
        default:
            fatalError("Unexpected kind")
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        guard let interactor = interactor else { return }
        
        // Section ve row bilgilerini al
        let sectionIndex = indexPath.section
        let rowIndex = indexPath.row
        
        // Section'ı al
        let section = interactor.getSection(at: sectionIndex)
        
        
        // İlgili item'ı almak için section türüne göre işlem yap
        switch section {
        case let filterSection as FilterSection:
            let filterItem = filterSection.filterSectionList[rowIndex]
            print("Selected filter item: \(filterItem)")
            
        case let sliderSection as SliderSection:
            let sliderItem = sliderSection.sliderSectionList[rowIndex]
            print("Selected slider item: \(sliderItem)")
            
            
        case let manuelSliderSection as ManuelSliderSection:
            let manuelSliderItem = manuelSliderSection.manuelSliderSectionList[rowIndex]
            print("Selected manual slider item: \(manuelSliderItem)")
            
        case let productCardSection as ProductCardSection:
            let productCardItem = productCardSection.productCardSectionList[rowIndex]
            print("Selected product card item: \(productCardItem)")
            
        default:
            print("Unknown section type")
        }
    }


    func getSectionType(for sectionIndex: Int) -> MainPageCellType {
        return interactor?.getSectionType(for: sectionIndex) ?? .filterCell
    }
}
