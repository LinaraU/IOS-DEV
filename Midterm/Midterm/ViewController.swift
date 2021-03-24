//
//  ViewController.swift
//  Midterm
//
//  Created by Linara Ualiyeva on 3/12/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, NewDelegate {
    func changeSomeCell(index: Int, time: String, writeDescription: String, switchOn: Bool) {
        list[index].description = writeDescription
        list[index].time = time
        list[index].switchOn = switchOn
        myTableView.reloadData()
    }
    
    
    func deleteSomeCell(index: Int) {
        self.list.remove(at: index)
        myTableView.reloadData()
    }
    
    

    func addSomeCell(time: String, writeDescription: String, switchOn: Bool) {
        let lists = timeDescription.init(time: time, writeDescription: writeDescription, switchOn: switchOn)
        self.list.append(lists)
        myTableView.reloadData()
    }
    
    var list = [timeDescription.init(time: "13:00", writeDescription: "go to school", switchOn: true)]
    var deletePlanetIndexPath: NSIndexPath? = nil
    
    
    @IBAction func addNew(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addContactVC = storyBoard.instantiateViewController(identifier: "AlarmViewController") as! AlarmViewController
        addContactVC.delegate = self 
        navigationController?.pushViewController(addContactVC, animated: true)
//        addContactVC.modalPresentationStyle = .fullScreen
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell") as! CustomCell
        cell.timeShow.text = list[indexPath.row].time
        cell.descriptionShow.text = list[indexPath.row].description
        cell.switchShow.isOn = list[indexPath.row].switchOn!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(identifier: "ChangeViewController") as! ChangeViewController
        detailsVC.delegate = self
        detailsVC.getTime = list[indexPath.row].time!
        detailsVC.getDescprition = list[indexPath.row].description!
        detailsVC.getSwitch = list[indexPath.row].switchOn!
        detailsVC.getIndex = indexPath.row
        
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

protocol NewDelegate{
    func deleteSomeCell(index: Int)
    func addSomeCell(time: String, writeDescription: String, switchOn: Bool)
    func changeSomeCell(index: Int, time: String, writeDescription: String, switchOn: Bool)
}

