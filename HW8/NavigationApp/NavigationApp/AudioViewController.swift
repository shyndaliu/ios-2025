//
//  ViewController.swift
//  NavigationApp
//
//  Created by Uldana Shyndali on 17.11.2025.
//

import UIKit

let audios: [TableItem] = [
    TableItem(title: "LIL FANTASY",
              subtitle: "by CHAEYOUNG",
              review: "Solo album by the member of the group TWICE. CHAEYOUNG have composed and written each of the track exploring her own unique style",
              image: #imageLiteral(resourceName: "track1"),
              category: .audio),
    
    TableItem(title: "2 полста",
              subtitle: "by Валерий Меладзе",
              review: "A soulful album by Валерий Меладзе with classic hits",
              image: #imageLiteral(resourceName: "track2"),
              category: .audio),
    
    TableItem(title: "Live Love A$AP",
              subtitle: "by A$AP ROCKY",
              review: "Energetic live performance captured in this album",
              image: #imageLiteral(resourceName: "track3"),
              category: .audio),
    
    TableItem(title: "Сұранамын",
              subtitle: "by Қайрат Нұртас",
              review: "Emotional album exploring love and life in Kazakh style",
              image: #imageLiteral(resourceName: "track4"),
              category: .audio),
    
    TableItem(title: "Release Some Tension",
              subtitle: "by SWV",
              review: "Classic R&B album full of smooth tracks and harmony",
              image: #imageLiteral(resourceName: "track5"),
              category: .audio)
]

class AudioViewController: ViewController {

    override var items: [TableItem] {
            return audios
    }
    
    override func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell") as! AudioTableViewCell
        let currentAudio = audios[indexPath.row]
        cell.configure(audio: currentAudio)
        return cell
    }
    
    override func getSelectedItem(indexPath: IndexPath) -> TableItem? {
        return audios[indexPath.row]
    }
    
}

