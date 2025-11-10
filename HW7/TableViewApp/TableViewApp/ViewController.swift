//
//  ViewController.swift
//  TableViewApp
//
//  Created by Uldana Shyndali on 10.11.2025.
//

import UIKit



enum Category : String, CaseIterable {
    case movie = "Movie"
    case audio = "Audio"
    case book = "Book"
    case course = "Course"
}
struct TableItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
    let category : Category
}

class ViewController: UIViewController, UITableViewDelegate {
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
                  category: .movie)
    ]
    
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
    
    let courses: [TableItem] = [
        TableItem(title: "OOP",
                  subtitle: "Lecturer: Pakizar Shamoi",
                  review: "Object-Oriented Programming fundamentals, principles, and practical exercises.",
                  image: #imageLiteral(resourceName: "course1"),
                  category: .course),
        
        TableItem(title: "System Design",
                  subtitle: "by Savoskin",
                  review: "Learn how to design scalable and efficient systems, covering architecture patterns and best practices.",
                  image: #imageLiteral(resourceName: "course2"),
                  category: .course),
        
        TableItem(title: "Introduction to ML",
                  subtitle: "by Oliver Jaylet",
                  review: "Basics of Machine Learning, including supervised and unsupervised learning techniques.",
                  image: #imageLiteral(resourceName: "course3"),
                  category: .course),
        
        TableItem(title: "Media Production",
                  subtitle: "Lecturer: [Name Unknown]",
                  review: "An overview of media production, covering video, audio, and content creation processes.",
                  image: #imageLiteral(resourceName: "course4"),
                  category: .course),
        
        TableItem(title: "History of Kazakhstan",
                  subtitle: "by Arman Jumadil",
                  review: "A comprehensive study of Kazakhstan's history from ancient times to the modern era.",
                  image: #imageLiteral(resourceName: "course5"),
                  category: .course)
    ]



    @IBOutlet private weak var table : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = Category.allCases[section]
        switch currentSection {
            case .movie: return movies.count
            case .audio: return audios.count
            case .book: return books.count
            case .course: return courses.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = Category.allCases[section]
        return "Fav \(category.rawValue)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = Category.allCases[indexPath.section]
        
        switch(currentSection){
        case .movie:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
            let currentMovie = movies[indexPath.row]
            cell.configure(movie: currentMovie)
            return cell
        case .audio:
            let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell") as! AudioTableViewCell
            let currentAudio = audios[indexPath.row]
            cell.configure(audio: currentAudio)
            return cell
        case .book:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
            let currentBook = books[indexPath.row]
            cell.configure(book: currentBook)
            return cell
        case .course:
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
            let currentCourse = courses[indexPath.row]
            cell.configure(course: currentCourse)
            return cell
        }
    }

}
