//
//  WorkOutTableView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

protocol WorkoutTableProtocol: AnyObject {
    
}

class WorkOutTableView: UITableView {
    
    weak var workoutTableProtocol: WorkoutTableProtocol?
    private let cellID = "WorkOutCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
        setDelegates()
        register(WorkOutTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    private func configure() {
        separatorStyle = .none
        backgroundColor = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension WorkOutTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        105
    }
}

extension WorkOutTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? WorkOutTableViewCell else {
            print("error")
            return UITableViewCell()
        }
        cell.mainViewDelegate = workoutTableProtocol as? WorkoutCellProtocol
        return cell
    }
}
