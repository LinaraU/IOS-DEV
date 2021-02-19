//
//  changeCotroller.swift
//  tableViewPorj
//
//  Created by Linara Ualiyeva on 2/11/21.
//

import UIKit

class changeCotroller: UIViewController {
    
    var delegate: NewDelegate?
    
    @IBOutlet weak var new_name: UITextField!
    
    @IBOutlet weak var new_number: UITextField!
    
//    @IBOutlet weak var choose_gender: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        self.delegate?.addSomeCell(name: new_name.text!, gpa: new_number.text!, image: "female")
        navigationController?.popViewController(animated: true)
    }

}
