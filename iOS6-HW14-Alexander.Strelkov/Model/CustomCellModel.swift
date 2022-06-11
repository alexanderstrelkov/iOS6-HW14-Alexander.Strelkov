//
//  CustomCellModel.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import Foundation
import UIKit

class CustomCellModel: Hashable {
    
    private let identifier = UUID()
    
    let image: UIImage
    let title: String
    let subtitle: String
    
    init(image: UIImage, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
    
    static func == (lhs: CustomCellModel, rhs: CustomCellModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    
}
