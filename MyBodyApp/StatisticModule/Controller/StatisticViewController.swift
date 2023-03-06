//
//  StatisticViewController.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private var titleStatistic = UILabel(title: "STATISTICS")
    
    private lazy var statisticSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Неделя", "Месяц"])
        segment.selectedSegmentTintColor = .specialYellow
        segment.backgroundColor = .specialGreen
        segment.selectedSegmentIndex = 0
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segment.setTitleTextAttributes([.font: font as Any, .foregroundColor: UIColor.white], for: .normal)
        segment.setTitleTextAttributes([.font: font as Any, .foregroundColor: UIColor.specialGray], for: .selected)
        segment.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private var exercisesLabel = UILabel(text: "Exercises")
    
    private var statisticsTableView = StatisticTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(titleStatistic)
        view.addSubview(statisticSegment)
        view.addSubview(exercisesLabel)
        view.addSubview(statisticsTableView)
    }
    
    @objc private func segmentedChange() {
        
        let changed = statisticSegment.selectedSegmentIndex == 0 ? "Неделя" : "Месяц"
        print(changed)
    }
}

extension StatisticViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleStatistic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleStatistic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statisticSegment.topAnchor.constraint(equalTo: titleStatistic.bottomAnchor, constant: 30),
            statisticSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            statisticSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticSegment.bottomAnchor, constant: 12),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            statisticsTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor),
            statisticsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            statisticsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
