//
//  ViewController.swift
//  AnimationApp
//
//  Created by Linara Ualiyeva on 3/31/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var emailCenter: NSLayoutConstraint!
    
    var xPosStart1: CGFloat?
       var xPosStart2 : CGFloat?
       var xPosition1: CGFloat?
       var xPosition2 : CGFloat?
       var yPosition1 : CGFloat?
       var yPosition2: CGFloat?
    @IBOutlet weak var passwordCenter: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
                xPosStart1 = emailField.center.x
                xPosStart2 = PasswordField.center.x
                xPosition1 = emailField.bounds.width
                xPosition2 = PasswordField.bounds.width
                
                yPosition1 = emailField.center.y
                yPosition2 = PasswordField.center.y
                self.mainButton.alpha = 0
                let options: UIView.AnimationOptions = [.curveEaseOut]
                UIView.animate(withDuration:1, delay: 0, options: options, animations: {
                    
                    self.emailField.center = CGPoint(x: self.xPosition1!,y:self.yPosition1!)
                    self.PasswordField.center = CGPoint(x: self.xPosition2!,y:self.yPosition2!)
                }, completion: nil)
                UIView.animate(withDuration:1, delay: 1, options: options, animations: {
                    self.mainButton.alpha = 1
                }, completion: nil)
            }
        // Do any additional setup after loading the view.
     //   emailCenter.constant = UIScreen.main.bounds.width
      //  passwordCenter.constant = -UIScreen.main.bounds.width

/*    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            emailCenter.constant = 0
            emailField.placeholder = "Email"
        PasswordField.placeholder = "Password"
            passwordCenter.constant = 0
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
                   self.view.layoutIfNeeded()
               }, completion: nil)
 
    } */
    @IBAction func buttonSegue(_ sender: UIButton) {
        let options: UIView.AnimationOptions = [.curveEaseOut]
                
                UIView.animate(withDuration:2, delay: 0, options: options, animations: {
                    self.emailField.center = CGPoint(x: self.xPosStart1!,y: self.emailField.center.y)
                    self.PasswordField.center = CGPoint(x: self.xPosStart2!+self.xPosition2!+self.xPosition2!,y: self.PasswordField.center.y)
                    
                }, completion: {_ in
                    self.performSegue(withIdentifier: "mySegue", sender: nil)
            
                })
    }
    
}

