//
//  UIButtonExtension.swift
//  iOs-Calculator
//
//  Created by Jose Carlos Duran on 09/07/2020.
//  Copyright © 2020 Jose Carlos Duran. All rights reserved.
//

import UIKit

extension UIButton {

    

    func roundBorder() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    
   
    func shineAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}
