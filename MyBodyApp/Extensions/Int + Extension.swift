//
//  Int + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 08.03.2023.
//

import UIKit

extension Int {
    
    func getTimeFromSeconds() -> String {
        if self == 0 {
            return "0"
        }
        
        if self / 60 == 0 {
            return "\(self) sec"
        } else if self % 60 == 0 {
            return "\(self / 60) min"
        } else {
            return "\(self / 60) min \(self % 60) sec"
        }
    }
}
