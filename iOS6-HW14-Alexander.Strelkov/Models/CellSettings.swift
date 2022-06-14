//
//  CellSettings.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import Foundation
import UIKit

struct CellSettings {
    var image: UIImage
    var title: String
    var subtitle: String
}

extension CellSettings {
    static func itemsForAlbumsCell() -> [CellSettings] {
        return [
            CellSettings(image: UIImage(named: "image0") ?? UIImage(), title: "Недавние", subtitle: "34"),
            CellSettings(image: UIImage(named: "image1") ?? UIImage(), title: "Instagram", subtitle: "573"),
            CellSettings(image: UIImage(named: "image2") ?? UIImage(), title: "WhatsApp", subtitle: "879"),
            CellSettings(image: UIImage(named: "image3") ?? UIImage(), title: "Работа", subtitle: "55"),
            CellSettings(image: UIImage(named: "image4") ?? UIImage(), title: "Путешествия", subtitle: "290"),
            CellSettings(image: UIImage(named: "image5") ?? UIImage(), title: "Мои фото", subtitle: "150"),
            CellSettings(image: UIImage(named: "image6") ?? UIImage(), title: "Избранное", subtitle: "80"),
            CellSettings(image: UIImage(named: "image7") ?? UIImage(), title: "Snapchat", subtitle: "10"),
            CellSettings(image: UIImage(named: "image8") ?? UIImage(), title: "Картинки", subtitle: "50"),
            CellSettings(image: UIImage(named: "image9") ?? UIImage(), title: "Всякое", subtitle: "15"),
            CellSettings(image: UIImage(named: "image10") ?? UIImage(), title: "Wallpapers", subtitle: "30"),
            CellSettings(image: UIImage(named: "image11") ?? UIImage(), title: "VK", subtitle: "300")
        ]
    }
    static func itemsForSecondAlbumsCell() -> [CellSettings] {
        return [
            CellSettings(image: UIImage(named: "image12") ?? UIImage(), title: "Недавние", subtitle: "51"),
            CellSettings(image: UIImage(named: "image13") ?? UIImage(), title: "Instagram", subtitle: "150"),
            CellSettings(image: UIImage(named: "image14") ?? UIImage(), title: "WhatsApp", subtitle: "544"),
            CellSettings(image: UIImage(named: "image15") ?? UIImage(), title: "Работа", subtitle: "17")
        ]
    }
    static func itemsForListsCell() -> [CellSettings] {
        return [
            CellSettings(image: UIImage(systemName: "video") ?? UIImage(), title: "Видео", subtitle: "188"),
            CellSettings(image: UIImage(systemName: "person.crop.square") ?? UIImage(), title: "Селфи", subtitle: "562"),
            CellSettings(image: UIImage(systemName: "livephoto") ?? UIImage(), title: "Фото Live Photos", subtitle: "362"),
            CellSettings(image: UIImage(systemName: "cube") ?? UIImage(), title: "Портреты", subtitle: "351"),
            CellSettings(image: UIImage(systemName: "pano") ?? UIImage(), title: "Панорамы", subtitle: "18"),
            CellSettings(image: UIImage(systemName: "timelapse") ?? UIImage(), title: "Таймлапс", subtitle: "1"),
            CellSettings(image: UIImage(systemName: "slowmo") ?? UIImage(), title: "Замедленно", subtitle: "4"),
            CellSettings(image: UIImage(systemName: "square.stack.3d.down.forward") ?? UIImage(), title: "Серии", subtitle: "14"),
            CellSettings(image: UIImage(systemName: "camera.viewfinder") ?? UIImage(), title: "Снимки экрана", subtitle: "297"),
            CellSettings(image: UIImage(systemName: "record.circle") ?? UIImage(), title: "Записи Экрана", subtitle: "10"),
            CellSettings(image: UIImage(systemName: "square.stack.3d.forward.dottedline") ?? UIImage(), title: "Анимированные", subtitle: "1")
        ]
    }
    static func itemsForSecondListsCell() -> [CellSettings] {
        return [
            CellSettings(image: UIImage(systemName: "square.and.arrow.down") ?? UIImage(), title: "Импортированные", subtitle: "175"),
            CellSettings(image: UIImage(systemName: "trash") ?? UIImage(), title: "Недавно удаленные", subtitle: "0")
        ]
    }
}
