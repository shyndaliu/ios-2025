//
//  ViewController.swift
//  NavigationApp
//
//  Created by Uldana Shyndali on 17.11.2025.
//

import UIKit


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




class CourseViewController: ViewController {

    override var items: [TableItem] {
            return courses
    }
    
    override func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
        let currentCourse = courses[indexPath.row]
        cell.configure(course: currentCourse)
        return cell
    }
    
    override func getSelectedItem(indexPath: IndexPath) -> TableItem? {
        return courses[indexPath.row]
    }
}

