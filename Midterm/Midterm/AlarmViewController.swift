//
//  AlarmViewController.swift
//  Midterm
//
//  Created by Linara Ualiyeva on 3/12/21.
//

import UIKit

class AlarmViewController: UIViewController{
    
    var delegate: NewDelegate!
    
    var descriptionOverride: String?
    var switchOnNew = true
    var timeNew: String?
    var getSwitch = Bool()
    var getDescprition = String()
    var time = String()
    
    var getNewTime: String?
    
    @IBAction func saveButton(_ sender: UIButton) {
        delegate.addSomeCell(time:  time, writeDescription: descriptionCreate.text!, switchOn: getSwitch)
            navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var descriptionCreate: UITextField!
    
    @IBOutlet weak var setTime: UIDatePicker!
    @IBAction func SetTime(_ sender: UIDatePicker) {
        let date = sender.date
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        time = "\(hour):\(minutes)"
        
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
