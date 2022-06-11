//
//  List.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 11.06.2022.
//

import UIKit

struct List {
    var image: UIImage
    var title: String
    var detail: String
}

extension List {
    static func itemsForCells() -> [List] {
        let cell1 = List(image: UIImage(systemName: "video")!, title: "Видео", detail: "188")
        let cell2 = List(image: UIImage(systemName: "person.crop.square")!, title: "Селфи", detail: "562")
        let cell3 = List(image: UIImage(systemName: "livephoto")!, title: "Фото Live Photos", detail: "362")
        let cell4 = List(image: UIImage(systemName: "cube")!, title: "Портреты", detail: "351")
        let cell5 = List(image: UIImage(systemName: "pano")!, title: "Панорамы", detail: "18")
        let cell6 = List(image: UIImage(systemName: "timelapse")!, title: "Таймлапс", detail: "1")
        let cell7 = List(image: UIImage(systemName: "slowmo")!, title: "Замедленно", detail: "4")
        let cell8 = List(image: UIImage(systemName: "square.stack.3d.down.forward")!, title: "Серии", detail: "14")
        let cell9 = List(image: UIImage(systemName: "camera.viewfinder")!, title: "Снимки экрана", detail: "297")
        let cell10 = List(image: UIImage(systemName: "record.circle")!, title: "Записи Экрана", detail: "10")
        let cell11 = List(image: UIImage(systemName: "square.stack.3d.forward.dottedline")!, title: "Анимированные", detail: "1")
        return [cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10, cell11]
    }
}
