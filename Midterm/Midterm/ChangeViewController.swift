//
//  ChangeViewController.swift
//  Midterm
//
//  Created by Linara Ualiyeva on 3/12/21.
//

import UIKit

class ChangeViewController: UIViewController {
    
    var descriptionOverride: String?
    var switchOnNew: Bool?
    var timeNew: String?
    var index: Int = 0

    var getTime = String()
    var getSwitch = Bool()
    var getDescprition = String()
    var getIndex = Int()
    var time = String()
    
    var delegate: NewDelegate?

    @IBOutlet weak var setTime: UIDatePicker!

    
    @IBOutlet weak var descpritionNew: UITextField!
    
    @IBAction func ChangeTime(_ sender: UIDatePicker) {let date = sender.date
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        time = "\(hour):\(minutes)"
        
            }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        dismiss(animated: true)
        delegate?.deleteSomeCell(index: index) 
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changePressed(_ sender: UIButton) {
        delegate?.changeSomeCell(index: index, time: time, writeDescription:
                                    descpritionNew.text!, switchOn: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descpritionNew.text = getDescprition
        
        // Do any additional setup after loading the view.
    }
    
    func putDetails(time: String, descpirtion: String, switchOn: Bool, index: Int){
            
        }
    
}
