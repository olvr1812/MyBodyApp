//
//  CalendarView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class CalendarView: UIView {
    
    private let calendarCollectionView = CollectionCalendarView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDelegate(_ delegate: CollectionCalendarViewProtocol?) {
        calendarCollectionView.collectionDelegate = delegate
    }
    
    private func setViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(calendarCollectionView)
    }
}

extension CalendarView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            calendarCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            calendarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            calendarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110)
        ])
    }
}
