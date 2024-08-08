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
    @IBOutlet weak var productStarRating: UIImageView!
    @IBOutlet weak var freeShipmentLabel: UILabel!
    @IBOutlet weak var productCardPriceLabel: UILabel!
    @IBOutlet weak var productCardImageContainer: UIView!
    @IBOutlet weak var productCardPriceLabelContainer: UIView!
    @IBOutlet weak var productCardDescriptionContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        productCardPriceLabel.textColor = .black
        productCardPriceLabel.font =  UIFont.systemFont(ofSize: 12, weight: .black
        )
        productCardPriceLabel.text = "100 TL"
        
        productCardImageContainer.backgroundColor = .clear
        productCardDescriptionContainer.backgroundColor = .clear
        productCardPriceLabelContainer.backgroundColor = .clear
        
        ProductCardLabel.numberOfLines = 2
        ProductCardLabel.font = UIFont.systemFont(ofSize: 13)
        ProductCardLabel.textColor = .black
        
        freeShipmentLabel.textAlignment = .center
        freeShipmentLabel.text = "ÜCRETSİZ KARGO"
        freeShipmentLabel.backgroundColor = UIColor(white: 0.5, alpha: 0.1)
        freeShipmentLabel.textColor = UIColor(named: "purple11")
        freeShipmentLabel.font = UIFont.systemFont(ofSize: 10, weight: .black)
    }
    
    
    func configureProductCard(with model: ProductCardCellModel) {
        ProductCardContainerView.layer.cornerRadius = 15
        ProductCardContainerView.backgroundColor = .white
        ProductCardImageView.image = UIImage(named: model.productImage)
        ProductCardLabel.text = model.productTitle
        if model.productRate == true {
            productStarRating.image = UIImage(named: "five-star-empty")
        }
        
    }
}
