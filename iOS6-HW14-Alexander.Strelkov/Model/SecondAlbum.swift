//
//  SecondAlbum.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import Foundation
import UIKit

struct SecondAlbum {
    var image: UIImage
    var title: String
    var subtitle: String
}

extension SecondAlbum {
    static func itemsForCells() -> [SecondAlbum] {
        let cell1 = SecondAlbum(image: UIImage(named: "image12")!, title: "Недавние", subtitle: "34")
        let cell2 = SecondAlbum(image: UIImage(named: "image13")!, title: "Instagram", subtitle: "573")
        let cell3 = SecondAlbum(image: UIImage(named: "image14")!, title: "WhatsApp", subtitle: "879")
        let cell4 = SecondAlbum(image: UIImage(named: "image15")!, title: "Работа", subtitle: "55")
        return [cell1, cell2, cell3, cell4]
    }
}
