//
//  ProductCardCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 2.08.2024.
//

import UIKit

class ProductCardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ProductCardContainerView: UIView!
    @IBOutlet weak var ProductCardImageView: UIImageView!
    @IBOutlet weak var ProductCardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    
    private func configureUI() {
        ProductCardContainerView.layer.cornerRadius = 15
        ProductCardContainerView.backgroundColor = UIColor(named: "purple11")
//        ProductCardImageView.image = UIImage(named: "n11")
        
        
//        ProductCardLabel.textColor = .white
//        ProductCardLabel.text = "Kuponlar"
        
    }
}
