//
//  NewWorkoutNameView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class NewWorkoutNameView: UIView, UITextFieldDelegate {
    
    private var nameLabel = UILabel(text: "Name")
    
    private var workoutNameTextField = BrownTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfig() {
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setViews() {
        addSubview(nameLabel)
        addSubview(workoutNameTextField)
    }
    
}

extension NewWorkoutNameView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            workoutNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            workoutNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            workoutNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            workoutNameTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
