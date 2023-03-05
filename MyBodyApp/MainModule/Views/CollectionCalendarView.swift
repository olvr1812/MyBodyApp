//
//  CollectionCalendarView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class CollectionCalendarView: UICollectionView {
    
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    private let cellID = "collectionCellID"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
        configure()
        setLayout()
        setDelegates()
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        collectionViewFlowLayout.minimumInteritemSpacing = 3
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: CollectionViewFlowLayoutDelegate
extension CollectionCalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate

extension CollectionCalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap collection cell", indexPath)
    }
}


// MARK: CollectionViewDataSource
extension CollectionCalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
}
