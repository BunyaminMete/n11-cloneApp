
//  MainPageViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

final class MainPageViewController: UIViewController, MainPageVC{
    private var mainCollectionView: UICollectionView!
    private let viewModel = MainPageViewModel()
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
    
    deinit{
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
    
    private func configureCustomNavigationBar(){
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
}

extension MainPageViewController {
    func buildCollectionView() {
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
        
        
        
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105), // Custom navigation bar height
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, env -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let sectionType = self.viewModel.getSection(at: sectionIndex).cellType
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
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontalProductSlider(hourlyOffer: true))
            
        default:
            fatalError("Unhandled cell type")
        }
    }
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getSectionsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getSection(at: section).itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.getSection(at: indexPath.section)
        let item = section.getItem(at: indexPath.row)
        switch section.cellType {
            
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ManuelSliderCollectionViewCell.reuseIdentifier, for: indexPath) as!
            ManuelSliderCollectionViewCell
            if let manuelSliderModel = item as? ImageManuelSliderCellModel {
                cell.configureManuelSlider(with: manuelSliderModel)
            }
            return cell
            
        case .productSliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCardCollectionViewCell
            if let productSliderModel = item as? ProductCardCellModel {
                cell.configureProductCard(with: productSliderModel)
            }
            return cell
            
        default:
            fatalError("Unhandled cell type")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = viewModel.getSection(at: indexPath.section)
        let item = section.getItem(at: indexPath.row)
        switch section.cellType {
        case .filterCell:
            print("item : \(item as? TopCategoryFilterCellModel)")
        case .imageSliderCell:
            print("item : \(item as? ImageSliderCellModel)")
        case .imageManuelSliderCell:
            print("item : \(item as? ImageManuelSliderCellModel)")
        case .productSliderCell:
            print("item : \(item as? ProductCardCellModel)")
        default:
            fatalError("Unhandled cell type")
        }
    }
}
