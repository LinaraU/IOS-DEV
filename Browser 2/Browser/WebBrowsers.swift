//
//  WebBrowsers.swift
//  Browser
//
//  Created by Linara Ualiyeva on 2/20/21.
//

import UIKit
import WebKit

class WebBrowsers: UITableViewController, NewDelegate {
    
    func deleteRow(name: String?, url: URL!) {
        list[1].removeLast()
    }
    
    
    func addFavoritesCell(name: String?, url: URL!) {
        list[1].append(List(name: name, url: url))
    }
    
    
    var list: [[List]] = [
        [List(name: "google", url: URL(string: "https://google.com")),
        List(name: "facebook", url: URL(string: "https://www.facebook.com"))],
        []
    ]
    
    var cur: Int!
    
    @objc func refresh() {
        
        self.tableView.reloadData() // a refresh the tableView.
        
    }

    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var chooseListToShow: UISegmentedControl!
    
    @IBAction func chooseList(_ sender: UISegmentedControl) {
        cur = sender.selectedSegmentIndex
                tableView.reloadData()
     
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Website", message: "Please fill all the fields", preferredStyle: UIAlertController.Style.alert )
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let urlField = alert.textFields![1].text!
            let name = alert.textFields![0].text!
            let listNew = List.init(name: name,url: URL(string: urlField))
           self.list[0].append(listNew)
           self.tableView.reloadData()
        }
        alert.addTextField { (textField) in
                textField.placeholder = "Name"
                textField.textColor = .red
            }
            //For second TF
            alert.addTextField { (textField) in
                textField.placeholder = "URL"
                textField.textColor = .blue
            }

            //Step : 4
            alert.addAction(save)
            let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
            alert.addAction(cancel)

            self.present(alert, animated:true, completion: nil)

    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Browsers"
        cur = 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
            return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list[cur].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            cell.textLabel?.text = list[cur][indexPath.row].name
        
        return cell
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail"{
            if let navcon = segue.destination as? UINavigationController{
                if let destination = navcon.visibleViewController as? infoBrowser{
                if let row = tableView.indexPathForSelectedRow?.row{
                    destination.delegate = self
                    destination.detailUrl = list[cur][row].url
                    destination.getName = list[cur][row].name!
                    destination.navigationItem.title = list[cur][row].name
                    }
                }
            }
        }
        
    }
    
  
}

public protocol NewDelegate: class{
   func addFavoritesCell(name: String?, url:URL!)
    func deleteRow(name: String?, url:URL!)
}
