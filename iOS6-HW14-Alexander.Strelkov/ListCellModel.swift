//
//  ListCellModel.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import Foundation
import UIKit

class ListCellModel: Hashable {
    
    private let identifier = UUID()
    
    let image: UIImage
    let title: String
    let detail: String
    
    init(image: UIImage, title: String, detail: String) {
        self.image = image
        self.title = title
        self.detail = detail
    }
    
    static func == (lhs: ListCellModel, rhs: ListCellModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    
}

