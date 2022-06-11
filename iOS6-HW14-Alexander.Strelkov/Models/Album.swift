//
//  albums.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import Foundation
import UIKit

struct Album {
    var image: UIImage
    var title: String
    var subtitle: String
}

extension Album {
    static func itemsForCells() -> [Album] {
        let cell1 = Album(image: UIImage(named: "image0")!, title: "Недавние", subtitle: "34")
        let cell2 = Album(image: UIImage(named: "image1")!, title: "Instagram", subtitle: "573")
        let cell3 = Album(image: UIImage(named: "image2")!, title: "WhatsApp", subtitle: "879")
        let cell4 = Album(image: UIImage(named: "image3")!, title: "Работа", subtitle: "55")
        let cell5 = Album(image: UIImage(named: "image4")!, title: "Путешествия", subtitle: "290")
        let cell6 = Album(image: UIImage(named: "image5")!, title: "Мои фото", subtitle: "150")
        let cell7 = Album(image: UIImage(named: "image6")!, title: "Избранное", subtitle: "80")
        let cell8 = Album(image: UIImage(named: "image7")!, title: "Snapchat", subtitle: "10")
        let cell9 = Album(image: UIImage(named: "image8")!, title: "Картинки", subtitle: "50")
        let cell10 = Album(image: UIImage(named: "image9")!, title: "Всякое", subtitle: "15")
        let cell11 = Album(image: UIImage(named: "image10")!, title: "Wallpapers", subtitle: "30")
        let cell12 = Album(image: UIImage(named: "image11")!, title: "VK", subtitle: "300")
        return [cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11, cell12]
    }
}
