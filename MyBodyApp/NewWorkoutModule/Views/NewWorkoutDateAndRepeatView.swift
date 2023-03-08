//
//  NewWorkoutDateAndRepeatView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class NewWorkoutDateAndRepeatView: UIView {
    
    private var nameLabel = UILabel(text: "Date and repeat")
    
    private var dateAndRepeatView: UIView = {
        let backView = UIView()
        backView.layer.cornerRadius = 10
        backView.backgroundColor = .specialBrown
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private var dateLabel = UILabel(text: "Date",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.tintColor = .specialGreen
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private var dateStack = UIStackView()
    
    private var repeatLabel = UILabel(text: "Repeat every 7 days",
                                      font: .robotoMedium18(),
                                      textColor: .specialGray)
    
    private lazy var switchRep: UISwitch = {
        let switchRep = UISwitch()
        switchRep.onTintColor = .specialDarkGreen
        switchRep.isOn = true
        switchRep.translatesAutoresizingMaskIntoConstraints = false
        return switchRep
    }()
    
    private var repeatStack = UIStackView()
    
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
        addSubview(dateAndRepeatView)
        dateStack = UIStackView(arrangedView: [dateLabel, datePicker],
                                spacing: 10,
                                axis: .horizontal)
        repeatStack = UIStackView(arrangedView: [repeatLabel, switchRep],
                                  spacing: 10,
                                  axis: .horizontal)
        addSubview(dateStack)
        addSubview(repeatStack)
    }
}

extension NewWorkoutDateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dateAndRepeatView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateAndRepeatView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            dateStack.topAnchor.constraint(equalTo: dateAndRepeatView.topAnchor, constant: 10),
            dateStack.leadingAnchor.constraint(equalTo: dateAndRepeatView.leadingAnchor, constant: 15),
            dateStack.trailingAnchor.constraint(equalTo: dateAndRepeatView.trailingAnchor, constant: -15),
            
            repeatStack.topAnchor.constraint(equalTo: dateStack.bottomAnchor, constant: 10),
            repeatStack.leadingAnchor.constraint(equalTo: dateAndRepeatView.leadingAnchor, constant: 15),
            repeatStack.trailingAnchor.constraint(equalTo: dateAndRepeatView.trailingAnchor, constant: -15)
        ])
    }
}
