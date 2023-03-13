//
//  DetailsView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 13.03.2023.
//

import UIKit

class DetailView: UIView {
    
    private var titleDetail = UILabel(title: "Biceps")
    private var workoutSets = WorkoutParametrs(parametrName: "Set", parametrValue: "1/4")
    private var workoutRepsOrTimer = WorkoutParametrs(parametrName: "Reps", parametrValue: "20")
    private var paramStack = UIStackView()
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.setImage(UIImage(named: "editing"), for: .normal)
        button.tintColor = UIColor(red: 185/255, green: 180/255, blue: 163/255, alpha: 1)
        button.titleLabel?.font = .robotoMedium16()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoMedium16()
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfigure() {
        layer.cornerRadius = 10
        backgroundColor = .specialBrown
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setViews() {
        addSubview(titleDetail)
        let arrangedView = [workoutSets, workoutRepsOrTimer]
        paramStack = UIStackView(arrangedView: arrangedView,
                                 spacing: 10,
                                 axis: .vertical)
        addSubview(paramStack)
        addSubview(editButton)
        addSubview(nextSetButton)
    }
    
}

extension DetailView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleDetail.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            titleDetail.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            paramStack.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: 16),
            paramStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            paramStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            paramStack.heightAnchor.constraint(equalToConstant: 60),
            
            editButton.topAnchor.constraint(equalTo: paramStack.bottomAnchor, constant: 30),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            editButton.widthAnchor.constraint(equalToConstant: 85),
            editButton.heightAnchor.constraint(equalToConstant: 24),
            
            nextSetButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 12),
            nextSetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextSetButton.widthAnchor.constraint(equalToConstant: 308),
            nextSetButton.heightAnchor.constraint(equalToConstant: 43)
            
            
        ])

        
    }
}
