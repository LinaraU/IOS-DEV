//
//  CustomCell.swift
//  Midterm
//
//  Created by Linara Ualiyeva on 3/12/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var timeShow: UILabel!
    
    @IBOutlet weak var descriptionShow: UILabel!
    
    @IBOutlet weak var switchShow: UISwitch!
    
    @IBAction func switchIsChanged(_ sender: UISwitch) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
