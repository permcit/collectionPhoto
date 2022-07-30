//
//  AlbumCell.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

class AlbumCell: UICollectionViewListCell {
    static let reuseIdentifer = "album-cell"
    let container = UIView()
    let titleLabel = UILabel()
    let foregroundView = UIImageView()
    let itemsCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupCunstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumCell {
    func configure() {
        container.layer.cornerRadius = 15
        foregroundView.image = UIImage(systemName: "rectangle.on.rectangle")
        foregroundView.tintColor = .gray
        container.backgroundColor = .lightGray
        titleLabel.text = "Album name"
        itemsCountLabel.text = "1"
        container.translatesAutoresizingMaskIntoConstraints = false
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemsCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupHierarchy() {
        contentView.addSubview(container)
        contentView.addSubview(foregroundView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(itemsCountLabel)
    }
    
    func setupCunstraints() {
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            foregroundView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            foregroundView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -0),
            foregroundView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            foregroundView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -0),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: itemsCountLabel.topAnchor, constant: 0),
            
            itemsCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            itemsCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            itemsCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            itemsCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }
}
