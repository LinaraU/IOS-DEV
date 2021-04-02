//
//  InfoTableViewCell.swift
//  AnimationApp
//
//  Created by Linara Ualiyeva on 3/31/21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var subtitleCell: UILabel!
  /*  @IBAction func showDetailAnimation(_ sender: UIButton) {
        perform(#selector(flipToSecond), with: nil, afterDelay: 00)
    }*/
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailSubtitle: UILabel!
    
    @IBAction func returnCell(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
                   self.secondView.transform = CGAffineTransform(translationX: self.secondView.bounds.width, y: 0)
                   
                   self.secondView.alpha = 0
                   
               }, completion: {_ in
                   self.contentView.insertSubview(self.mainView, aboveSubview: self.secondView)
                   self.secondView.transform = CGAffineTransform(translationX: 0, y: 0)
                   self.secondView.alpha = 1
                self.layer.backgroundColor = self.mainView.layer.backgroundColor
                   self.accessoryType = .detailButton
               })
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
