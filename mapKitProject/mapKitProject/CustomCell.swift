//
//  CustomCell.swift
//  mapKitProject
//
//  Created by Linara Ualiyeva on 3/24/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var showTitle: UILabel!
    @IBOutlet weak var showDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
