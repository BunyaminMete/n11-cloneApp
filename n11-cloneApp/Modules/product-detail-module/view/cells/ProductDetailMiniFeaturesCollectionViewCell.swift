//
//  ProductDetailMiniFeaturesCollectionViewCell.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 8.08.2024.
//

import UIKit

class ProductDetailMiniFeaturesCollectionViewCell: UICollectionViewCell {

    
    private let detailMiniContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Üst Label"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let subLabel1: UILabel = {
        let label = UILabel()
        label.text = "Sub Label"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star") // Örnek bir SF Symbol
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let subLabel2: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomLabel1: UILabel = {
        let label = UILabel()
        label.text = "Label 1"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel2: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLabel3: UILabel = {
        let label = UILabel()
        label.text = "Label 3"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let finalLabel1: UILabel = {
        let label = UILabel()
        label.text = "Final Label 1"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finalLabel2: UILabel = {
        let label = UILabel()
        label.text = "Final Label 2"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let finalLabel3: UILabel = {
        let label = UILabel()
        label.text = "Final Label 3"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(detailMiniContainer) // Burada contentView'a ekliyoruz
        detailMiniContainer.addSubview(topLabel)
        detailMiniContainer.addSubview(subLabel1)
        detailMiniContainer.addSubview(subImageView)
        detailMiniContainer.addSubview(subLabel2)
        detailMiniContainer.addSubview(separator1)
        detailMiniContainer.addSubview(bottomView1)
        bottomView1.addSubview(bottomLabel1)
        bottomView1.addSubview(bottomLabel2)
        bottomView1.addSubview(bottomLabel3)
        detailMiniContainer.addSubview(separator2)
        detailMiniContainer.addSubview(finalLabel1)
        detailMiniContainer.addSubview(finalLabel2)
        detailMiniContainer.addSubview(finalLabel3)
        
        // Constraints burada
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // detailMiniContainer Constraints
            detailMiniContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailMiniContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailMiniContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailMiniContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            // Top Label Constraints
            topLabel.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor, constant: 10),
            topLabel.trailingAnchor.constraint(equalTo: detailMiniContainer.trailingAnchor, constant: -10),
            topLabel.topAnchor.constraint(equalTo: detailMiniContainer.topAnchor, constant: 10),

            // Sub Label 1 Constraints
            subLabel1.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor, constant: 10),
            subLabel1.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),

            // Sub ImageView Constraints
            subImageView.leadingAnchor.constraint(equalTo: subLabel1.trailingAnchor, constant: 10),
            subImageView.centerYAnchor.constraint(equalTo: subLabel1.centerYAnchor),
            subImageView.widthAnchor.constraint(equalToConstant: 20),
            subImageView.heightAnchor.constraint(equalToConstant: 20),

            // Sub Label 2 Constraints
            subLabel2.leadingAnchor.constraint(equalTo: subImageView.trailingAnchor, constant: 10),
            subLabel2.centerYAnchor.constraint(equalTo: subLabel1.centerYAnchor),

            // Separator 1 Constraints
            separator1.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor),
            separator1.trailingAnchor.constraint(equalTo: detailMiniContainer.trailingAnchor),
            separator1.topAnchor.constraint(equalTo: subLabel1.bottomAnchor, constant: 10),
            separator1.heightAnchor.constraint(equalToConstant: 1),

            // Bottom View 1 Constraints
            bottomView1.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor),
            bottomView1.trailingAnchor.constraint(equalTo: detailMiniContainer.trailingAnchor),
            bottomView1.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 10),
            bottomView1.heightAnchor.constraint(equalToConstant: 60),

            // Bottom Labels Constraints
            bottomLabel1.leadingAnchor.constraint(equalTo: bottomView1.leadingAnchor, constant: 10),
            bottomLabel1.topAnchor.constraint(equalTo: bottomView1.topAnchor, constant: 10),

            bottomLabel2.leadingAnchor.constraint(equalTo: bottomLabel1.trailingAnchor, constant: 10),
            bottomLabel2.topAnchor.constraint(equalTo: bottomView1.topAnchor, constant: 10),

            bottomLabel3.trailingAnchor.constraint(equalTo: bottomView1.trailingAnchor, constant: -10),
            bottomLabel3.topAnchor.constraint(equalTo: bottomView1.topAnchor, constant: 10),

            // Separator 2 Constraints
            separator2.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor),
            separator2.trailingAnchor.constraint(equalTo: detailMiniContainer.trailingAnchor),
            separator2.topAnchor.constraint(equalTo: bottomView1.bottomAnchor, constant: 10),
            separator2.heightAnchor.constraint(equalToConstant: 1),

            // Final Labels Constraints
            finalLabel1.leadingAnchor.constraint(equalTo: detailMiniContainer.leadingAnchor, constant: 10),
            finalLabel1.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 10),

            finalLabel2.leadingAnchor.constraint(equalTo: finalLabel1.trailingAnchor, constant: 10),
            finalLabel2.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 10),

            finalLabel3.trailingAnchor.constraint(equalTo: detailMiniContainer.trailingAnchor, constant: -10),
            finalLabel3.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 10),
            finalLabel3.bottomAnchor.constraint(equalTo: detailMiniContainer.bottomAnchor, constant: -10)
        ])
    }
}


