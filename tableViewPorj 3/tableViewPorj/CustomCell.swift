//
//  CustomCell.swift
//  tableViewPorj
//
//  Created by Linara Ualiyeva on 2/11/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var student_image: UIImageView!
    @IBOutlet weak var student_name_surname: UILabel!
    @IBOutlet weak var student_gpa: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
