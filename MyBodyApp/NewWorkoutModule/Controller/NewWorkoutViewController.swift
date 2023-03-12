//
//  NewWorkoutViewController.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private var titleNewWorkoutLabel = UILabel(title: "NEW WORKOUT")
    private lazy var closeWorkoutButton: UIButton = CloseButton()
    
    private var newWorkoutNameView = NewWorkoutNameView()
    private var newWorkoutCollectionImages = NewWorkoutCollectionImages()
    private var newWorkoutDateAndReps = NewWorkoutDateAndRepeatView()
    private var newWorkoutRepsOrTimer = NewWorkoutRepsOrTimerView()
    private var saveButton = GreenButton(text: "SAVE")
    
    private var workoutModel = WorkoutModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        targets()
        addGestures()
    }
    
    private func setViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(titleNewWorkoutLabel)
        view.addSubview(closeWorkoutButton)
        view.addSubview(newWorkoutNameView)
        view.addSubview(newWorkoutCollectionImages)
        view.addSubview(newWorkoutDateAndReps)
        view.addSubview(newWorkoutRepsOrTimer)
        view.addSubview(saveButton)
    }
    
    private func targets() {
        closeWorkoutButton.addTarget(self, action: #selector(closeWorkoutController), for: .touchUpInside)
    }
    
    
    
    @objc private func closeWorkoutController() {
        dismiss(animated: true)
    }
}

// MARK: - Set Constraints

extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleNewWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleNewWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeWorkoutButton.centerYAnchor.constraint(equalTo: titleNewWorkoutLabel.centerYAnchor),
            closeWorkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeWorkoutButton.widthAnchor.constraint(equalToConstant: 33),
            closeWorkoutButton.heightAnchor.constraint(equalToConstant: 33),

            newWorkoutNameView.topAnchor.constraint(equalTo: titleNewWorkoutLabel.bottomAnchor, constant: 20),
            newWorkoutNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            newWorkoutNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            newWorkoutNameView.heightAnchor.constraint(equalToConstant: 56),
            
            newWorkoutCollectionImages.topAnchor.constraint(equalTo: newWorkoutNameView.bottomAnchor, constant: 20),
            newWorkoutCollectionImages.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            newWorkoutCollectionImages.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            newWorkoutCollectionImages.heightAnchor.constraint(equalToConstant: 80),

            newWorkoutDateAndReps.topAnchor.constraint(equalTo: newWorkoutCollectionImages.bottomAnchor, constant: 20),
            newWorkoutDateAndReps.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            newWorkoutDateAndReps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            newWorkoutDateAndReps.heightAnchor.constraint(equalToConstant: 110),

            newWorkoutRepsOrTimer.topAnchor.constraint(equalTo: newWorkoutDateAndReps.bottomAnchor, constant: 20),
            newWorkoutRepsOrTimer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            newWorkoutRepsOrTimer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            newWorkoutRepsOrTimer.heightAnchor.constraint(equalToConstant: 300),

            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
