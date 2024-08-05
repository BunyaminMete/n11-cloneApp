//
//  ManuelSliderCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import UIKit

class ManuelSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageSlider: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageSlider.clipsToBounds = true

        // Initialization code
    }
    
    func configureManuelSlider(with model: ImageManuelSliderCellModel){
        imageSlider.image = UIImage(named: model.imageName)
    }
    
    
    

}
