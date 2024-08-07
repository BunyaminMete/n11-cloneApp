//
//  ProductDetailViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 7.08.2024.
//

import UIKit

class ProductDetailViewController: UIViewController {
    let button = UIButton(type: .system)
    let bottomView = UIView()
    
    var product: ProductCardCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        button.setTitle(product?.productTitle, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .lightGray
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        
        view.addSubview(button)
        
        if let product = product {
            print(product)
        }
        
        bottomView.backgroundColor = .gray
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     bottomView.heightAnchor.constraint(equalToConstant: 100)])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    @objc private func onButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
}
