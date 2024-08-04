//
//  MainMenuPresenter.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import Foundation

final class MainPagePresenter: MainPageInteractorOutput {
    var interactor: MainPageInteractor?
    weak var view: MainPageVC?

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
}
