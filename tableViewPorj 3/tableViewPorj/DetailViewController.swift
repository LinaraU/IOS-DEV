//
//  DetailViewController.swift
//  tableViewPorj
//
//  Created by Linara Ualiyeva on 2/11/21.
//

import UIKit

class DetailViewController: UIViewController {
   
    var name: String?
    var number: String?
    var image: UIImage?
    var index: Int = 0
    
    @IBOutlet weak var person_number: UILabel!
    @IBOutlet weak var person_name_surname: UILabel!
    @IBOutlet weak var person_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person_name_surname.text = getName
        person_image.image = UIImage(named: getImage)
        person_number.text = number
        index = getIndex
//        putDetails(name: "aaa", number: "332", image: "female", index: 0)

        // Do any additional setup after loading the view.
    }
    
    
    func putDetails(name: String, number: String, image: String, index: Int){
        person_image.image = UIImage(named: "female")
        person_name_surname.text = name
        person_number.text = number
    }
    
    var getImage = String()
    var getName = String()
    var getNumber = String()
    var getIndex = Int()
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if let vc = segue.destination as? DetailViewController {
//
//            vc.delegate = self
//
//        }
//    }
    var delegate: NewDelegate?
    @IBAction func deleteFunc(_ sender: UIButton) {
            dismiss(animated: true)
        delegate?.deleteSomeCell(index: index)
        navigationController?.popViewController(animated: true)
    }
}
