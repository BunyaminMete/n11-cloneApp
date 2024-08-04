//
//  ImageSliderCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 4.08.2024.
//

import UIKit

class ImageSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageSlider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageSlider.clipsToBounds = true
//        imageSlider.contentMode = .scaleAspectFill
    }

    
    func configureSlidedImage(with model: ImageSliderCellModel){
        imageSlider.image = UIImage(named: model.imageName)
    }
}
