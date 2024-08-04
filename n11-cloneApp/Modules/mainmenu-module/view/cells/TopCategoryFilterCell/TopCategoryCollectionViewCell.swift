//
//  TopCategoryCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 3.08.2024.
//

import UIKit

class TopCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var TopCategoryImageView: UIImageView!
    @IBOutlet weak var TopCategoryLabel: UILabel!
    @IBOutlet weak var TopCategoryContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI(){
        TopCategoryLabel.textColor = .white
        TopCategoryLabel.font = .systemFont(ofSize: 12)
        TopCategoryLabel.textAlignment = .center
        
        TopCategoryContainerView.layer.cornerRadius = 10
//        TopCategoryContainerView.backgroundColor = .red
        
        TopCategoryImageView.layer.cornerRadius = 20
//        TopCategoryImageView.backgroundColor = .yellow
        
    }
    
    func setup(model: TopCategoryFilterCellModel) {
        TopCategoryImageView.image = UIImage(named: model.imageName)
        TopCategoryLabel.text = model.title
        

    }
    

}
