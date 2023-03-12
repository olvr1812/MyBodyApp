//
//  BrownTextField.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class BrownTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        borderStyle = .none
        layer.cornerRadius = 10
        backgroundColor = .specialBrown
        font = .robotoBold20()
        textColor = .specialGray
        leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 15,
                                        height: 0))
        leftViewMode = .always
        returnKeyType = .done
        clearButtonMode = .always
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - UITextFieldDelegate


extension BrownTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
