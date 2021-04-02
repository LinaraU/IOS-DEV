//
//  MainTableViewController.swift
//  AnimationApp
//
//  Created by Linara Ualiyeva on 3/31/21.
//

import UIKit

class MainTableViewController: UITableViewController {

    struct List{
        var title: String?
        var subtitle: String?
        var flipTitle: String?
        var flipSubtitle: String?
    }
    
    var items = [List(title:"iPhone 12 Pro", subtitle: "$999", flipTitle: "AMX", flipSubtitle: "BMX"),
                 List(title:"Galaxy Note 20 ", subtitle: "$499", flipTitle: "AMX", flipSubtitle: "BMX"),
                 List(title:"Watch Sport", subtitle: "$79", flipTitle: "AMX", flipSubtitle: "BMX"),
                 List(title:"iPhone 12 mini DS", subtitle: "$799", flipTitle: "AMX", flipSubtitle: "BMX"),
                 List(title:"iPhone 7 Plus", subtitle: "$299", flipTitle: "AMX", flipSubtitle: "BMX")
        ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! InfoTableViewCell
        cell.titleCell.text = items[indexPath.row].title
        cell.subtitleCell.text = items[indexPath.row].subtitle
        cell.detailTitle.text = items[indexPath.row].flipTitle
        cell.detailSubtitle.text = items[indexPath.row].flipSubtitle
        cell.accessoryType = .detailButton
        let delay = Double(indexPath.row) * 0.2
                UIView.animate(withDuration: 0.7, delay: TimeInterval(delay), usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                    cell.frame.origin.x = 0
                }, completion: nil)
                
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! InfoTableViewCell
        cell.accessoryType = .none
        cell.layer.backgroundColor = cell.secondView.layer.backgroundColor
        UIView.transition(with: cell.contentView,
                          duration: 0.6,
                          options: .transitionFlipFromTop,
                          animations:  {
                            cell.contentView.insertSubview(cell.secondView, aboveSubview: cell.mainView)
        },
                          completion:nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
