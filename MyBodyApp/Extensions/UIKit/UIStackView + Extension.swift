//
//  UIStackView + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedView: [UIView], spacing: CGFloat, axis: NSLayoutConstraint.Axis) {
        self.init(arrangedSubviews: arrangedView)
        self.spacing = spacing
        self.axis = axis
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

