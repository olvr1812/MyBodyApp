//
//  StartWorkoutViewController.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 13.03.2023.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private var titleLabel = UILabel(title: "START WORKOUT")
    private lazy var closeButton = CloseButton()
    private var backImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsman")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let detailLabel = UILabel(text: "Details")
    
    private let parametrsWorkoutView = DetailView()
    private lazy var finishButton = GreenButton(text: "FINISH")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfig()
        setViews()
        setConstraints()
    }
    
    private func setConfig() {
        view.backgroundColor = .specialBackground
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    private func setViews() {
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(backImage)
        view.addSubview(detailLabel)
        view.addSubview(parametrsWorkoutView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeView() {
        dismiss(animated: true)
    }
    
    
}

extension StartWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            
            backImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            backImage.heightAnchor.constraint(equalToConstant: 243),
            backImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            parametrsWorkoutView.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 51),
            parametrsWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            parametrsWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            parametrsWorkoutView.heightAnchor.constraint(equalToConstant: 238),
            
            detailLabel.bottomAnchor.constraint(equalTo: parametrsWorkoutView.topAnchor, constant: -5),
            detailLabel.leadingAnchor.constraint(equalTo: parametrsWorkoutView.leadingAnchor),
            
            finishButton.topAnchor.constraint(equalTo: parametrsWorkoutView.bottomAnchor, constant: 13),
            finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishButton.widthAnchor.constraint(equalToConstant: 345),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
