//
//  ViewController.swift
//  NavigationApp
//
//  Created by Uldana Shyndali on 17.11.2025.
//

import UIKit

let movies: [TableItem] = [
    TableItem(title: "Everything. Everywhere. All at once.",
              subtitle: "by Daniel Kwan and Daniel Scheinert",
              review: "Oskar nominee movie with psychodelic drama comedy genre.",
              image: #imageLiteral(resourceName: "movie1"),
              category: .movie),
    
    TableItem(title: "Inglourious Basterds",
              subtitle: "by Quentin Tarantino",
              review: "Classic by Tarantino, engaging plot and great actors",
              image: #imageLiteral(resourceName: "movie2"),
              category: .movie),
    
    TableItem(title: "Blue Spring",
              subtitle: "by Toshiaki Toyoda",
              review: "Coming of age movie with a sad ending",
              image: #imageLiteral(resourceName: "movie3"),
              category: .movie),
    
    TableItem(title: "The Big Lebowski",
              subtitle: "by Joel and Ethan Coen",
              review: "The best comedy of all time, mayonnaise scene is the most memorable one",
              image: #imageLiteral(resourceName: "movie4"),
              category: .movie),
    
    TableItem(title: "Perfect Blue",
              subtitle: "by Satoshi Kon",
              review: "Full-length anime movie, which was an inspiration for the 'Black Swan'. Absolute must watch.",
              image: #imageLiteral(resourceName: "movie5"),
              category: .movie),
    TableItem(title: "Interstellar",
                  subtitle: "by Christopher Nolan",
                  review: "A visually stunning sci-fi epic exploring space, time, and human perseverance.",
                  image: #imageLiteral(resourceName: "movie6"),
                  category: .movie),
        
        TableItem(title: "Barbie",
                  subtitle: "by Greta Gerwig",
                  review: "A colorful, fun, and satirical take on the iconic doll’s world, full of humor and life lessons.",
                  image: #imageLiteral(resourceName: "movie7"),
                  category: .movie),
        
        TableItem(title: "Harakiri (1966)",
                  subtitle: "by Masaki Kobayashi",
                  review: "A powerful samurai drama examining honor, revenge, and societal hypocrisy.",
                  image: #imageLiteral(resourceName: "movie8"),
                  category: .movie),
        
        TableItem(title: "The Good, the Bad and the Ugly",
                  subtitle: "by Sergio Leone",
                  review: "Legendary spaghetti western with unforgettable characters and iconic music by Ennio Morricone.",
                  image: #imageLiteral(resourceName: "movie9"),
                  category: .movie),
        
        TableItem(title: "Superman (2025)",
                  subtitle: "by James Gunn",
                  review: "Superhero adventure promising action-packed sequences and modern take on the classic hero.",
                  image: #imageLiteral(resourceName: "movie10"),
                  category: .movie)
    ]

class MovieViewController: ViewController {

    override var items: [TableItem] {
            return movies
    }
    
    override func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        let currentMovie = movies[indexPath.row]
        cell.configure(movie: currentMovie)
        return cell
    }
    
    override func getSelectedItem(indexPath: IndexPath) -> TableItem? {
        return movies[indexPath.row]
    }
}

