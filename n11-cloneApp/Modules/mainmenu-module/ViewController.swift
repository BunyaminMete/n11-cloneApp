//
//  ViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let labelExample = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomNavigationBar()
    }
    
    private func configureCustomNavigationBar(){
        let nib = UINib(nibName: "CustomNavigationBar", bundle: nil)
        guard let customNavBar = nib.instantiate(withOwner: self, options: nil).first as? CustomNavigationBar else { return }
        
        customNavBar.backgroundColor = UIColor(hex: "#5D3BBB")
        customNavBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 120)
        labelExample.text = "Deneme Yazısı"
        labelExample.frame = CGRect(x: 0, y: customNavBar.bounds.height, width: view.bounds.width, height: 20)

        
        view.addSubview(customNavBar)
        view.addSubview(labelExample)

        
        
        if let superview = view.superview {
            customNavBar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                customNavBar.topAnchor.constraint(equalTo: superview.topAnchor),
                customNavBar.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                customNavBar.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                customNavBar.topAnchor.constraint(equalTo: superview.bottomAnchor),

                ])
        }
        
    
    }
    
    
    
}

