//
//  BasketViewController.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 6.08.2024.
//

import UIKit

class BasketViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        
        let categoryPageVC = CategoryPageRouter.createModule()
        addChild(categoryPageVC)
        categoryPageVC.view.frame = self.view.bounds
        self.view.addSubview(categoryPageVC.view)
        categoryPageVC.didMove(toParent: self)
        // Do any additional setup after loading the view.
    }
    
}
