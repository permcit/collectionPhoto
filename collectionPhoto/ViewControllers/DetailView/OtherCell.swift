//
//  OtherCell.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

class OtherCell: UICollectionViewListCell {
    static let reuseIdentifer = "other-cell"
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accessories = [.disclosureIndicator()]
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.textColor = .systemBlue
        nameLabel.font = UIFont(name: "Helvetica", size: 18)
        nameLabel.adjustsFontForContentSizeCategory = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.height/1.5),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height/1.5),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}

