//
//  CustomNavigationBar.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

class CustomNavigationBar: UIView {
    
    @IBOutlet weak var notificationAlertButton: UIButton!
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var leftImageBrandLogo: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchIconButton: UIButton!
    @IBOutlet weak var imageBrandLogoContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadii()
    }
    
    private func configureUI() {
        self.backgroundColor = UIColor(hex: "#5D3BBB")
        
        let searchIcon = UIImage(systemName: "magnifyingglass")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold))
        searchIconButton.setImage(searchIcon, for: .normal)
        searchIconButton.tintColor = .systemGray
        
        
        if let user = notificationAlertButton {
            user.layer.cornerRadius = 25
        }
        
        if let textField = searchTextField {
            textField.backgroundColor = .white
            textField.borderStyle = .none
        }
    }
    
    private func applyCornerRadii() {
        searchContainerView.layer.cornerRadius = 20
        searchTextField.layer.cornerRadius = 20
        
        imageBrandLogoContainer.layer.cornerRadius = 20
        imageBrandLogoContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    
}
