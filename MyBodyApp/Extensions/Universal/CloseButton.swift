//
//  CloseButton.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setImage(UIImage(named: "closeButton"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
