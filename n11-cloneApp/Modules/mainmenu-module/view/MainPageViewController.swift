
//  MainPageViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

final class MainPageViewController: UIViewController, MainPageVC {
    private var mainCollectionView: UICollectionView!
    private let presenter = MainPagePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        presenter.view = self
        let interactor = MainPageInteractor()
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        configureCustomNavigationBar()
        buildCollectionView()
        setCompositionalLayout()
        presenter.startSlider()
    }
    
    deinit {
        presenter.stopSlider()
    }
    
    func numberOfItemsInSliderSection() -> Int {
        let sectionIndex = 1
        return mainCollectionView.numberOfItems(inSection: sectionIndex)
    }
    
    func scrollToItem(at index: Int) {
        let indexPath = IndexPath(item: index, section: 1)
        mainCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func configureCustomNavigationBar() {
        let nib = UINib(nibName: "CustomNavigationBar", bundle: nil)
        guard let customNavBar = nib.instantiate(withOwner: self, options: nil).first as? CustomNavigationBar else { return }
        
        customNavBar.backgroundColor = UIColor(hex: "#5D3BBB")
        customNavBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 120)
        
        view.addSubview(customNavBar)
        
        if let superview = view.superview {
            customNavBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                customNavBar.topAnchor.constraint(equalTo: superview.topAnchor),
                customNavBar.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                customNavBar.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                customNavBar.heightAnchor.constraint(equalToConstant: 120)
            ])
        }
        
        let nibLabel = UINib(nibName: "SubLabelCollectionViewCell", bundle: nil)
        guard let customLabel = nibLabel.instantiate(withOwner: self, options: nil).first as? SubLabelCollectionViewCell else { return }
        
        view.addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: customNavBar.topAnchor, constant: 120),
            customLabel.leadingAnchor.constraint(equalTo: customNavBar.leadingAnchor),
            customLabel.trailingAnchor.constraint(equalTo: customNavBar.trailingAnchor),
            customLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .white
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        mainCollectionView.register(cellClass: TopCategoryCollectionViewCell.self)
        mainCollectionView.register(cellClass: ImageSliderCollectionViewCell.self)
        mainCollectionView.register(cellClass: ManuelSliderCollectionViewCell.self)
        mainCollectionView.register(cellClass: ProductCardCollectionViewCell.self)
        
        mainCollectionView.register(UINib(nibName: "ProductCardHeaderReusableView", bundle: nil),  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProductCardHeaderReusableView.headerIdentifier)
        
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105), // Custom navigation bar height
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, env -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let sectionType = self.presenter.getSectionType(for: sectionIndex)
            return self.layoutSection(for: sectionType)
        }
        layout.register(BackgroundView.self, forDecorationViewOfKind: "background")
        layout.register(BackgroundLightView.self, forDecorationViewOfKind: "lightbackground")
        
        mainCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func layoutSection(for cellType: MainPageCellType) -> NSCollectionLayoutSection {
        switch cellType {
        case .filterCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontal(isSlider: false))
        case .imageSliderCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontalImageSlider)
        case .imageManuelSliderCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontalImageManuelSlider)
        case .productSliderCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontalProductSlider(hourlyOffer: ProductCardHeaderReusableView.headerIdentifier))
        default:
            fatalError("Unhandled cell type")
        }
    }
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.getSectionsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getNumberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presenter.getCell(for: indexPath, in: collectionView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            return presenter.getHeaderView(for: kind, at: indexPath, in: collectionView)
        }
        fatalError("Unexpected kind")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}
