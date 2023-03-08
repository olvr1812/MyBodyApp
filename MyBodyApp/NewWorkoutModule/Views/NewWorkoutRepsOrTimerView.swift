//
//  NewWorkoutRepsOrTimerView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class NewWorkoutRepsOrTimerView: UIView {
    
    private var nameLabel = UILabel(text: "Reps or timer")
    
    private var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var setsSlider = SliderView(minVal: 0, maxVal: 10, text: "Sets")
    private var chooseLabel = UILabel(text: "Choose repeat or timer")
    private var repsSlider = SliderView(minVal: 0, maxVal: 10, text: "Reps")
    private var timerSlider = SliderView(minVal: 0, maxVal: 10, text: "Timer")
    
    private var stackView = UIStackView()
    
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
        chooseLabel.textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setViews() {
        addSubview(nameLabel)
        addSubview(backView)
        
        stackView = UIStackView(arrangedView: [setsSlider, chooseLabel, repsSlider, timerSlider],
                                spacing: 10,
                                axis: .vertical)
        
        addSubview(stackView)
    }
    
    
}

extension NewWorkoutRepsOrTimerView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            backView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
            
            
        ])
    }
}
