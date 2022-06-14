//
//  CustomCollectionViewCell.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 08.06.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    var imageView = UIImageView()
    var contentContainer = UIView()
    var title = UILabel()
    var subtitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarhy()
        setupLayout()
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

extension CustomCollectionViewCell {
    
    func setupHierarhy() {
        contentView.addSubview(contentContainer)
        contentContainer.addSubview(imageView)
        contentContainer.addSubview(title)
        contentContainer.addSubview(subtitle)
    }
    
    func setupLayout() {
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .lightGray
        
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
