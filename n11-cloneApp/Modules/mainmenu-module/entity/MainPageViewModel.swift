//
//  MainPageViewModel.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 6.08.2024.
//

import Foundation

// MARK: - MainPageViewModel.swift

final class MainPageViewModel {
    private var sectionList: [SectionModel] = []
    
    init() {
        generateFilterSection()
        generateSliderSection()
        generateManuelSliderSection()
        generateProductCardSection()
    }
    
    func generateFilterSection() {
        let filterSectionList: [TopCategoryFilterCellModel] = [
            TopCategoryFilterCellModel(
                title: "Tıklamayan Kalmasın",
                imageName: "n11-cabuk"
            ),
            TopCategoryFilterCellModel(
                title: "Kuponlar",
                imageName: "discount-coupon"
            ),
            TopCategoryFilterCellModel(
                title: "Yurt Dışından",
                imageName: "global-delivery"
            ),
            TopCategoryFilterCellModel(
                title: "Sana Özel",
                imageName: "for-you"
            ),
            TopCategoryFilterCellModel(
                title: "Siparişlerim",
                imageName: "my-orders"
            )
        ]
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
    
    func generateManuelSliderSection() {
        let manuelSliderSectionList: [ImageManuelSliderCellModel] = [
            ImageManuelSliderCellModel(imageName: "manuelbanner1"),
            ImageManuelSliderCellModel(imageName: "manuelbanner2"),
            ImageManuelSliderCellModel(imageName: "manuelbanner3"),
            ImageManuelSliderCellModel(imageName: "manuelbanner4")
        ]
        sectionList.append(ManuelSliderSection(manuelSliderSectionList: manuelSliderSectionList))
    }
    
    func generateProductCardSection() {
        let productCardSectionList: [ProductCardCellModel] = [
            ProductCardCellModel(productImage: "product1", productTitle: "Samsung Monitör", productRate: false, productPrice: 30, freeShipment: false),
            ProductCardCellModel(productImage: "img-samsung-telefon-big", productTitle: "Ultra HD Samsung HD2349201 4K/8K 2 Yıl Garantili 48 Telefon", productRate: true, productPrice: 30, freeShipment: false),
            ProductCardCellModel(productImage: "product1", productTitle: "Ultra HD Samsung HD2349201 4K/8K 2 Yıl Garantili 48", productRate: true, productPrice: 30, freeShipment: false),
            ProductCardCellModel(productImage: "product1", productTitle: "Beyzbol sopası ile dünya haritası", productRate: true, productPrice: 30, freeShipment: false)
        ]
        sectionList.append(ProductCardSection(productCardSectionList: productCardSectionList))
    }
    
    func getSectionsCount() -> Int {
        return sectionList.count
    }
    
    func getSection(at index: Int) -> SectionModel {
        return sectionList[index]
    }
}

