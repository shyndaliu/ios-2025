//
//  ViewController.swift
//  NavigationApp
//
//  Created by Uldana Shyndali on 17.11.2025.
//

import UIKit

let books: [TableItem] = [
    TableItem(title: "The Brothers Karamazov",
              subtitle: "by Fyodor Dostoevsky",
              review: "A profound exploration of morality, faith, and family dynamics in 19th century Russia.",
              image: #imageLiteral(resourceName: "book1"),
              category: .book),
    
    TableItem(title: "The Man Who Laughs",
              subtitle: "by Victor Hugo",
              review: "A dark and romantic tale exploring society's treatment of the disfigured and outcasts.",
              image: #imageLiteral(resourceName: "book2"),
              category: .book),
    
    TableItem(title: "Choke",
              subtitle: "by Chuck Palahniuk",
              review: "A provocative novel about addiction, identity, and the absurdity of modern life.",
              image: #imageLiteral(resourceName: "book3"),
              category: .book),
    
    TableItem(title: "Тозақ оттары жымындайды",
              subtitle: "by Төлен Әбдікұлы",
              review: "One of the most unique stories in Kazakh Literature, which explores the themes of colonialism and identity.",
              image: #imageLiteral(resourceName: "book4"),
              category: .book),
    
    TableItem(title: "Slaughterhouse 5",
              subtitle: "by Kurt Vonnegut",
              review: "A satirical, science-fiction infused anti-war novel about the bombing of Dresden.",
              image: #imageLiteral(resourceName: "book5"),
              category: .book)
]


class BookViewController: ViewController {

    override var items: [TableItem] {
            return books
    }
    
    override func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
        let currentBook = books[indexPath.row]
        cell.configure(book: currentBook)
        return cell
    }
    
    override func getSelectedItem(indexPath: IndexPath) -> TableItem? {
        return books[indexPath.row]
    }
}

