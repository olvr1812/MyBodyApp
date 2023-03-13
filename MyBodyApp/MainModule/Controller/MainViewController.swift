//
//  MainViewController.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var userPhotoImageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.layer.borderWidth = 5
        imageVIew.layer.borderColor = UIColor.white.cgColor
        imageVIew.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        return imageVIew
    }()
    
    private let calendarView = CalendarView()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your name"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                              left: 20,
                                              bottom: 15,
                                              right: 0)
        button.setTitle("Add workout", for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 50,
                                              left: -40,
                                              bottom: 0,
                                              right: 0)
        button.addShadowOfView()
        button.titleLabel?.font = .robotoMedium12()
        button.addTarget(self, action: #selector(addWorkoutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var titleWorkoutTable = UILabel(text: "Workout today")
    
    private let weatherView = WeatherView()
    private let workOutTable = WorkOutTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
        setDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    private func setViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(titleWorkoutTable)
        view.addSubview(workOutTable)
    }
    
    private func setDelegates() {
        calendarView.setDelegate(self)
        workOutTable.workoutTableProtocol = self
    }
    
    @objc private func addWorkoutButtonTapped() {
        let newWorkoutViewController = NewWorkoutViewController()
        newWorkoutViewController.modalPresentationStyle = .fullScreen
        present(newWorkoutViewController, animated: true)
    }
}

extension MainViewController: WorkoutCellProtocol {
    func startButtonTaped() {
        let startWorkoutViewController = StartWorkoutViewController()
        startWorkoutViewController.modalPresentationStyle = .fullScreen
        present(startWorkoutViewController, animated: true)
    }
}

extension MainViewController: WorkoutTableProtocol {
    
}

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80),
            
            titleWorkoutTable.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 14),
            titleWorkoutTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleWorkoutTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            workOutTable.topAnchor.constraint(equalTo: titleWorkoutTable.bottomAnchor, constant: 5),
            workOutTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workOutTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workOutTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: CollectionCalendarViewProtocol {
    func selectedItem(date: Date) {
        print(date)
    }
    
    
}

