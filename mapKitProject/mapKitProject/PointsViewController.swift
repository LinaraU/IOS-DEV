//
//  PointsViewController.swift
//  mapKitProject
//
//  Created by Linara Ualiyeva on 3/24/21.
//

import UIKit

class PointsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewDelegate{
    
    func addSomeCell(title: String, subtitle: String) {
        let points = List.init(title: title, subtitle: subtitle)
        self.lists.append(points)
        myTableView.reloadData()
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    var lists = [List.init(title: "Almaty", subtitle: "i live here")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"myCell") as! CustomCell
        cell.showTitle.text = lists[indexPath.row].title
        cell.showDescription.text = lists[indexPath.row].subtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
protocol NewDelegate{
    func addSomeCell(title: String, subtitle: String)
}
