//
//  ViewController.swift
//  tableViewPorj
//
//  Created by Linara Ualiyeva on 2/11/21.
//

import UIKit

struct Students {
    var name: String
    var gpa: String
    var image: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewDelegate {
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let addContactVC = storyboard?.instantiateViewController(identifier: "changeCotroller") as! changeCotroller
        addContactVC.delegate = self
        
        navigationController?.pushViewController(addContactVC, animated: true)
        addContactVC.modalPresentationStyle = .fullScreen
    }
    
    var students = [Student.init("Linara1", "3.0", UIImage.init(named: "female")!),
                    Student.init("Linara2", "2.0", UIImage.init(named: "female")!),
                    Student.init("Linara3", "4.0", UIImage.init(named: "female")!)
    ]

    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailsVC.delegate = self
        detailsVC.getName = students[indexPath.row].name_surname!
//        detailsVC.getImage = students[indexPath.row].image!
        detailsVC.getNumber = students[indexPath.row].gpa!
        detailsVC.getIndex = indexPath.row
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func deleteSomeCell(index: Int) {
        self.students.remove(at: index)
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func addSomeCell(name: String, gpa: String, image: String) {
        let student = Student.init(name, gpa, UIImage(named: image)!)
        self.students.append(student)
        print("contact added")
        myTableView.reloadData()
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"myCell") as! CustomCell
        cell.student_name_surname.text = students[indexPath.row].name_surname
        cell.student_gpa.text = students[indexPath.row].gpa
        cell.student_image.image = students[indexPath.row].image
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        }
    
    }
 
protocol NewDelegate{
    func deleteSomeCell(index: Int)
    func addSomeCell(name: String, gpa: String, image: String)
}
 
 
