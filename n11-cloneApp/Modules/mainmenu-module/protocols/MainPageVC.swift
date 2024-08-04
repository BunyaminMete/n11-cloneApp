//
//  MainPageVC.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import Foundation

protocol MainPageVC: AnyObject {
    func numberOfItemsInSliderSection() -> Int
    func scrollToItem(at index: Int)
}
