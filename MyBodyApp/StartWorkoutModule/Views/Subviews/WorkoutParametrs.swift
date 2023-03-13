//
//  WorkoutParametrs.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 13.03.2023.
//

import UIKit

class WorkoutParametrs: UIView {
    
    private let paramName = UILabel(text: "",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let paramValue = UILabel(text: "",
                                     font: .robotoMedium24(),
                                     textColor: .specialGray)
    
    private let bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .specialLine
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(parametrName: String, parametrValue: String) {
        self.init()
        self.paramName.text = parametrName
        self.paramValue.text = parametrValue
        setConfig()
        setViews()
        setConstraints()
    }
    
    private func setConfig() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setViews() {
        addSubview(paramName)
        addSubview(paramValue)
        addSubview(bottomLine)
    }
}

extension WorkoutParametrs {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            paramName.topAnchor.constraint(equalTo: topAnchor),
            paramName.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            paramValue.topAnchor.constraint(equalTo: topAnchor),
            paramValue.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomLine.topAnchor.constraint(equalTo: paramValue.bottomAnchor, constant: 2),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
