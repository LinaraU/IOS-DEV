//
//  CustomAnimationSegue.swift
//  AnimationApp
//
//  Created by Linara Ualiyeva on 3/31/21.
//

import UIKit

class CustomAnimationSegue: UIStoryboardSegue {
    override func perform() {
        let destination = self.destination.view
                let source = self.source.view
                //source
            

                //destination
                self.source.present(self.destination, animated: false){
                    source?.alpha = 0
                    
                    destination?.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
                    UIView.animate(withDuration: 1, animations: {
                        destination?.transform = CGAffineTransform.identity
                       
                    })
                    
                }
    }
}
