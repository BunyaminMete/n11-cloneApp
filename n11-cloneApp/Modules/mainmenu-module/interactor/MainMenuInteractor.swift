//
//  MainMenuInteractor.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 3.08.2024.
//


import Foundation

// MARK: - MainPageInteractor.swift

final class MainPageInteractor {
    private var sliderTimer: Timer?
    private var currentIndex = 0
    weak var presenter: MainPageInteractorOutput?
    private let viewModel = MainPageViewModel()
    
    func startSliderTimer() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    func stopSliderTimer() {
        sliderTimer?.invalidate()
        sliderTimer = nil
    }
    
    @objc private func scrollToNextItem() {
        guard let numberOfItems = presenter?.numberOfItemsInSliderSection(), numberOfItems > 0 else { return }
        
        let nextIndex = (currentIndex + 1) % numberOfItems
        currentIndex = nextIndex
        presenter?.scrollToItem(at: nextIndex)
    }
    
    func getSectionsCount() -> Int {
        return viewModel.getSectionsCount()
    }
    
    func getSection(at index: Int) -> SectionModel {
        return viewModel.getSection(at: index)
    }
    
    func getSectionType(for sectionIndex: Int) -> MainPageCellType {
        switch viewModel.getSection(at: sectionIndex) {
        case is FilterSection:
            return .filterCell
        case is SliderSection:
            return .imageSliderCell
        case is ManuelSliderSection:
            return .imageManuelSliderCell
        case is ProductCardSection:
            return .productSliderCell
        default:
            fatalError("Unhandled section type")
        }
    }
}
