//
//  hapticFeedback.swift
//  Furnituery
//
//  Created by Gokul Nair on 22/09/20.
//

import Foundation
import  AVKit


class haptickFeedback {
  
    func haptiFeedback1() {
    //print("haptick done")
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
    }
    
    func haptiFeedback2() {
    //print("haptick done")
    let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
}

