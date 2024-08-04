//
//  SubLabelCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 5.08.2024.
//

import UIKit

class SubLabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var mergeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        subLabel.text = "⚡️ Üye Ol / Giriş Yap"
        subLabel.textColor = UIColor(named: "purple11")
        subLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        mergeLabel.text = "fırsatları kaçırma!"
        mergeLabel.textColor = .black
        mergeLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        
        
    }

}
