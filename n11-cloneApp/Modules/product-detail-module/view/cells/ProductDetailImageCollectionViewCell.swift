//
//  ProductDetailImageCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 8.08.2024.
//

import UIKit

class ProductDetailImageCollectionViewCell: UICollectionViewCell {

//    @IBOutlet weak var backToRootButton: UIButton!
    @IBOutlet weak var productDetailImageView: UIImageView!
//    weak var delegate: ProductDetailImageCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
//        backToRootButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        
        // Initialization code
//        backToRootButton.addTarget(self, action: #selector(returnToRoot), for: .touchUpInside)
    }
    
    
    
//    @objc private func returnToRoot(){
//        delegate?.didTapBackToRootButton(in: self)
//    }
    
    

}
