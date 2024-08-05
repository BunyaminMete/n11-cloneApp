//
//  MainPageInteractorOutput.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import Foundation

protocol MainPageInteractorOutput: AnyObject {
    func numberOfItemsInSliderSection() -> Int
    func scrollToItem(at index: Int)
}

protocol MainPageVC: AnyObject {
    func numberOfItemsInSliderSection() -> Int
    func scrollToItem(at index: Int)
}
