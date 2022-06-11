//
//  ListCollectionViewCell.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListCollectionViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemBlue
        return label
    }()
    
    private let detail: UILabel = {
        let detailLabel = UILabel()
        detailLabel.textColor = .lightGray
        return detailLabel
    }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
    
    func configureCell(titleText: String, detailText: String, image: UIImage?) {
            title.text = titleText
            detail.text = detailText
            imageView.image = image
        }
    

    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ListCollectionViewCell {
    func configure() {
        contentView.addSubview(title)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(imageView)
        contentView.addSubview(detail)
        contentView.clipsToBounds = true
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 2, y: 6, width: size, height: size)
    
        let imageSize: CGFloat = size/1.5
        imageView.frame = CGRect(x: (size - imageSize)/2, y: (size - imageSize)/2, width: imageSize, height: imageSize)

        title.frame = CGRect(
            x: 10 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        detail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    
    }
}


