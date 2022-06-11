//
//  SecondCollectionViewCell.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SecondCollectionViewCell"
    var imageView = UIImageView()
    var contentContainer = UIView()
    var title = UILabel()
    var subtitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(titleText: String, subtitleText: String, image: UIImage?) {
        title.text = titleText
        subtitle.text = subtitleText
        imageView.image = image
    }
}

extension SecondCollectionViewCell {
    func configure() {
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentContainer)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        subtitle.textColor = .lightGray
        contentContainer.addSubview(imageView)
        contentContainer.addSubview(title)
        contentContainer.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            contentContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentContainer.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentContainer.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}

