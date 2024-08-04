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
//        generateSliderSection()
//        generateMostRecommendedSection()
    }
}

extension MainPageViewModel {
    func generateFilterSection() {
        let filterSectionList: [TopCategoryFilterCellModel] = [
            TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "diamond"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "diamond"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "diamond"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "diamond"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),TopCategoryFilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
            TopCategoryFilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),
            TopCategoryFilterCellModel(
            title: "Finans",
            imageName: "wallet"
        )]
        sectionList.append(FilterSection(filterSectionList: filterSectionList))
    }
    
//    func generateSliderSection() {
//        var sliderList: [SliderCellModel] = [
//        SliderCellModel(
//            title: "OlMAZSA OLMAZLAR",
//            subTitle: "Snapchat",
//            description: "Yaşadığın Anı Paylaş",
//            imageName: "snapchat",
//            isAppInstalled: true
//        ),
//        SliderCellModel(
//            title: "NE IZLEMELI",
//            subTitle: "YouTube",
//            description: "Tüm dünyada izlenenleri keşfet",
//            imageName: "youtube",
//            isAppInstalled: false
//        ),
//        SliderCellModel(
//            title: "FORMA GIR",
//            subTitle: "Adidas",
//            description: "Antrenman Planını Seç",
//            imageName: "adidas",
//            isAppInstalled: true
//        )]
//        sectionList.append(SliderSection(sliderList: sliderList))
//    }
//    
//    func generateMostRecommendedSection() {
//        var mostRecommendedList: [MostRecommendedCellModel] = [
//        MostRecommendedCellModel(
//            imageName: "snapchat",
//            title: "Snapchat",
//            description: "Anı Paylaş",
//            isAppInstalled: true
//        ),
//        MostRecommendedCellModel(
//            imageName: "youtube",
//            title: "YouTube",
//            description: "Tüm Dünyada İzlenenleri Keşfet",
//            isAppInstalled: false
//        ),
//        MostRecommendedCellModel(
//            imageName: "adidas",
//            title: "Adidas",
//            description: "Antrenman Programını Ayarla",
//            isAppInstalled: true
//        ),
//        MostRecommendedCellModel(
//            imageName: "whatsapp",
//            title: "WhatsApp",
//            description: "WhatsApp Açıklaması",
//            isAppInstalled: true
//        ),
//        MostRecommendedCellModel(
//            imageName: "telegram",
//            title: "Telegram",
//            description: "Telegram Açıklaması",
//            isAppInstalled: true
//        ),
//        MostRecommendedCellModel(
//            imageName: "twitter",
//            title: "Twitter",
//            description: "Twitter Açıklaması",
//            isAppInstalled: false
//        )]
//        sectionList.append(MostRecommendedSection(mostRecommendedList: mostRecommendedList))
//    }
    
    func getSectionsCount() -> Int {
        return sectionList.count
    }
    
    func getSection(at section: Int) -> SectionModel {
        return sectionList[section]
    }
}
