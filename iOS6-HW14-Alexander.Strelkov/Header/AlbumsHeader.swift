//
//  HeaderCollectionReusableView.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import UIKit

class AlbumsHeader: UICollectionReusableView {
    
    static let identifier = "AlbumsHeader"
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AlbumsHeader {
    func configure() {
        backgroundColor = .none
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = .boldSystemFont(ofSize: 20)
        
    }
}


