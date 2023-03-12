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
    
    private var setsSlider = SliderView(minVal: 0, maxVal: 10, text: "Sets", type: .sets)
    private var chooseLabel = UILabel(text: "Choose repeat or timer")
    private var repsSlider = SliderView(minVal: 0, maxVal: 50, text: "Reps", type: .reps)
    private var timerSlider = SliderView(minVal: 0, maxVal: 600, text: "Timer", type: .timer)
    
    private var stackView = UIStackView()
    
    public var (sets, reps, timer) = (0, 0, 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
        setViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private methods
    
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
    
    private func setDelegates() {
        setsSlider.delegate = self
        repsSlider.delegate = self
        timerSlider.delegate = self
    }
    
// MARK: - Public methods
    public func resetRepsOrTimerView() {
        repsSlider.resetValues()
        setsSlider.resetValues()
        timerSlider.resetValues()
    }
    
}

//MARK: - SliderViewProtocol

extension NewWorkoutRepsOrTimerView: SliderViewProtocol {
    func somethingFunc(type: SliderType, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsSlider.isActive = true
            timerSlider.isActive = false
            timer = 0
        case .timer:
            timer = value
            repsSlider.isActive = false
            timerSlider.isActive = true
            reps = 0
        }
    }
}

//MARK: - Set Constraints

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
