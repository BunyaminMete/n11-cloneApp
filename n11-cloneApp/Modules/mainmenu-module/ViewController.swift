//
//  ViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var mainCollectionView: UICollectionView!
    private let viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomNavigationBar()
        buildCollectionView()
        setCompositionalLayout()
        self.view.backgroundColor = .white
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
    }
}

extension ViewController {
    func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .white
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        
        mainCollectionView.register(cellClass: TopCategoryCollectionViewCell.self)
        mainCollectionView.register(cellClass: ImageSliderCollectionViewCell.self)
        
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100), // Custom navigation bar height
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
        
        mainCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func layoutSection(for cellType: MainPageCellType) -> NSCollectionLayoutSection {
        switch cellType {
        case .filterCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontal(isSlider: false))
        case .imageSliderCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontalImageSlider)
        default:
            fatalError("Unhandled cell type")
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
                //                cell.backgroundColor = .yellow
            }
            return cell
            
        case .imageSliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageSliderCollectionViewCell
            if let sliderModel = item as? ImageSliderCellModel {
                cell.configureSlidedImage(with: sliderModel)
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
        default:
            fatalError("Unhandled cell type")
        }
    }
}
