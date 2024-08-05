//
//  MainMenuModel.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 3.08.2024.
//

import Foundation

protocol SectionModel {
    var sectionTitle: String? { get }
    var itemCount: Int { get }
    var cellType: MainPageCellType { get }
    func getItem(at index: Int) -> Any
}

struct FilterSection: SectionModel {
    var sectionTitle: String?
    
    var filterSectionList: [TopCategoryFilterCellModel]
    
    var itemCount: Int {
        return filterSectionList.count
    }
    
    var cellType: MainPageCellType {
        return .filterCell
    }
    
    func getItem(at index: Int) -> Any {
        filterSectionList[index]
    }
}

struct SliderSection: SectionModel {
    var sectionTitle: String?
    
    var sliderSectionList: [ImageSliderCellModel]
    
    var itemCount: Int {
        return sliderSectionList.count
    }
    
    var cellType: MainPageCellType{
        return .imageSliderCell
    }
    
    func getItem(at index: Int) -> Any {
        sliderSectionList[index]
    }
    
}

struct ManuelSliderSection : SectionModel {
    var sectionTitle: String?
    
    var manuelSliderSectionList: [ImageManuelSliderCellModel]
    
    var itemCount: Int {
        return manuelSliderSectionList.count
    }
    
    var cellType: MainPageCellType {
        return .imageManuelSliderCell
    }
    
    func getItem(at index: Int) -> Any {
        manuelSliderSectionList[index]
    }
    
    
}
