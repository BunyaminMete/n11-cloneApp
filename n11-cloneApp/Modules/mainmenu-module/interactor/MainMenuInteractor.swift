//
//  MainMenuInteractor.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 3.08.2024.
//


import Foundation

final class MainPageViewModel {
    private var sectionList: [SectionModel] = []
    
    init() {
        generateFilterSection()
        generateSliderSection()
        generateManuelSliderSection()
    }
}

// MARK: - Slider timer events

final class MainPageInteractor {
    private var sliderTimer: Timer?
    private var currentIndex = 0
    weak var presenter: MainPageInteractorOutput?
    
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
}


//MARK: - MainPageViewModel Extensions
extension MainPageViewModel {
    func generateFilterSection() {
        let filterSectionList: [TopCategoryFilterCellModel] = [
            TopCategoryFilterCellModel(
                title: "Tıklamayan Kalmasın",
                imageName: "n11-cabuk"
            ),
            TopCategoryFilterCellModel(
                title: "Kuponlar",
                imageName: "discount-coupon"
            ),TopCategoryFilterCellModel(
                title: "Yurt Dışından",
                imageName: "global-delivery"
            ),
            TopCategoryFilterCellModel(
                title: "Sana Özel",
                imageName: "for-you"
            ),TopCategoryFilterCellModel(
                title: "Siparişlerim",
                imageName: "my-orders"
            )]
        sectionList.append(FilterSection(filterSectionList: filterSectionList))
    }
    
    func generateSliderSection() {
        let sliderSectionList: [ImageSliderCellModel] = [
            ImageSliderCellModel(imageName: "autoslideritem1"),
            ImageSliderCellModel(imageName: "autoslideritem2"),
            ImageSliderCellModel(imageName: "autoslideritem3"),
            ImageSliderCellModel(imageName: "autoslideritem4"),
            ImageSliderCellModel(imageName: "autoslideritem5")
        ]
        sectionList.append(SliderSection(sliderSectionList: sliderSectionList))
    }
    
    func generateManuelSliderSection(){
        let manuelSliderSectionList: [ImageManuelSliderCellModel] = [
            ImageManuelSliderCellModel(imageName: "manuelbanner1"),
            ImageManuelSliderCellModel(imageName: "manuelbanner2"),
            ImageManuelSliderCellModel(imageName: "manuelbanner3"),
            ImageManuelSliderCellModel(imageName: "manuelbanner4")
        ]
        sectionList.append(ManuelSliderSection(manuelSliderSectionList: manuelSliderSectionList))
    }
    
    func getSectionsCount() -> Int {
        return sectionList.count
    }
    
    func getSection(at section: Int) -> SectionModel {
        return sectionList[section]
    }
}
