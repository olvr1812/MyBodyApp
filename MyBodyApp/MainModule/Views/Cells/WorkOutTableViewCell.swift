//
//  WorkOutTableViewCell.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class WorkOutTableViewCell: UITableViewCell {
    
    private var backgroundCell: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .specialBrown
        cellView.layer.cornerRadius = 30
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
    }()
    
    private var imageBackground: UIView = {
        let backView = UIView()
        backView.layer.cornerRadius = 20
        backView.backgroundColor = .specialBackground
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private var workoutImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pull Ups"
        label.font = .robotoMedium22()
        label.textColor = .specialBlack
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutRepsLabel: UILabel = {
       let label = UILabel()
        label.text = "Reps: 10"
        label.textColor = .specialGray
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutSetsLabel: UILabel = {
       let label = UILabel()
        label.text = "Sets: 2"
        label.textColor = .specialGray
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statistStackView = UIStackView()
    
    private lazy var workoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("START", for: .normal)
        button.backgroundColor = .specialYellow
        button.addShadowOfView()
        button.titleLabel?.font = .robotoBold16()
        button.setTitleColor(.specialDarkGreen, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        backgroundCell.addSubview(imageBackground)
        imageBackground.addSubview(workoutImage)
        backgroundCell.addSubview(workoutNameLabel)
        
        statistStackView = UIStackView(arrangedView: [workoutRepsLabel, workoutSetsLabel],
                                       spacing: 10,
                                       axis: .horizontal)
        backgroundCell.addSubview(statistStackView)
    
        contentView.addSubview(workoutButton)
    }
}

// MARK: - Set Constraints

extension WorkOutTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.heightAnchor.constraint(equalToConstant: 100),
            
            imageBackground.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 9),
            imageBackground.widthAnchor.constraint(equalToConstant: 79),
            imageBackground.heightAnchor.constraint(equalToConstant: 79),
            
            workoutImage.topAnchor.constraint(equalTo: imageBackground.topAnchor, constant: 10),
            workoutImage.leadingAnchor.constraint(equalTo: imageBackground.leadingAnchor, constant: 10),
            workoutImage.trailingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: -10),
            workoutImage.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor, constant: -10),
            
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            
            statistStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor),
            statistStackView.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 10),
            statistStackView.heightAnchor.constraint(equalToConstant: 20),
            
            workoutButton.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -10),
            workoutButton.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: 10),
            workoutButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            workoutButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
