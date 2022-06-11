//
//  SecondList.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import UIKit

struct SecondList {
    var image: UIImage
    var title: String
    var detail: String
}

extension SecondList {
    static func itemsForCells() -> [SecondList] {
        let cell1 = SecondList(image: UIImage(systemName: "square.and.arrow.down")!, title: "Импортированные", detail: "175")
        let cell2 = SecondList(image: UIImage(systemName: "trash")!, title: "Недавно удаленные", detail: "0")
        return [cell1, cell2]
    }
}
