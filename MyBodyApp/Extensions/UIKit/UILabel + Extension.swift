//
//  UILabel + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    convenience init(title: String = "") {
        self.init()
        self.text = title
        self.font = .robotoMedium24()
        self.adjustsFontSizeToFitWidth = true
        self.textColor = .specialGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.minimumScaleFactor = 0.5
    }
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
