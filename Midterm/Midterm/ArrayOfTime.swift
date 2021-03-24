//
//  ArrayOfTime.swift
//  Midterm
//
//  Created by Linara Ualiyeva on 3/12/21.
//

import Foundation
class timeDescription{
    var description: String?
    var switchOn: Bool?
    var time: String?
    init(time: String, writeDescription: String, switchOn: Bool) {
        self.time = time
        self.description = writeDescription
        self.switchOn = switchOn
    }
    
    
}
