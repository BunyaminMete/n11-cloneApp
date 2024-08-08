//
//  CategoryPageVC.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import UIKit

protocol CategoryPageViewProtocol: AnyObject {
    func displayCategories(_ categories: [String])
}

class CategoryPageVC: UIViewController, CategoryPageViewProtocol {
    var presenter: CategoryPagePresenterProtocol!
    
    func displayCategories(_ categories: [String]) {
        print(categories)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureCustomNavigationBar()
        setupDenemeView()

        // Do any additional setup after loading the view.
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
    
    private func setupDenemeView() {
        let nib = UINib(nibName: "CategoryCollectionView", bundle: nil)
        guard let denemeView = nib.instantiate(withOwner: self, options: nil).first as? CategoryCollectionView else { return }
        
        denemeView.backgroundColor = UIColor(hex: "#F5F5F5") // Arka plan rengini ayarlayabilirsiniz
        denemeView.frame = CGRect(x: 0, y: 120, width: view.bounds.width, height: view.bounds.height - 120)
        
        view.addSubview(denemeView)
        
        
        if let superview = view.superview {
            denemeView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                denemeView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 200),
                denemeView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                denemeView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                denemeView.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        }
    }

}
