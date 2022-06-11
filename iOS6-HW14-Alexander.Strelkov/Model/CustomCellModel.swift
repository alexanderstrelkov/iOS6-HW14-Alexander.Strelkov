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
    
    init(_ image: UIImage) {
        self.image = image
    }
    
    static func == (lhs: CustomCellModel, rhs: CustomCellModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    
}
