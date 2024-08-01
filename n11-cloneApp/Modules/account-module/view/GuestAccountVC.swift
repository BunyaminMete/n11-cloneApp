//
//  GuestAccountVC.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

class GuestAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    
    // MARK: - Navigation
    private func configureUI() {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let navItem = UINavigationItem(title: "Hesabım")
        navigationBar.setItems([navItem], animated: false)
        self.view.addSubview(navigationBar)
        
        
        
        
        
    }
    
    

}
