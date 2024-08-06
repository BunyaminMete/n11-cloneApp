//
//  ProductCardHeaderReusableView.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 6.08.2024.
//

import UIKit

class ProductCardHeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var counterContainer: UIView!
    @IBOutlet weak var counterFirst: UILabel!
    @IBOutlet weak var counterSecond: UILabel!
    @IBOutlet weak var counterThird: UILabel!
    
    static let headerIdentifier = "ProductCardHeaderReusableView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let counters = [counterContainer, counterFirst, counterSecond, counterThird]
        counters.forEach { $0?.layer.cornerRadius = 10; $0?.layer.masksToBounds = true }
        
        
    }
    
}
