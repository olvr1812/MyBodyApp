//
//  NewWorkoutCollectionImages.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 12.03.2023.
//

import UIKit

class NewWorkoutCollectionImages: UICollectionView {

    private let collectionLayout = UICollectionViewFlowLayout()
    private let cellID = "newWorkoutCollectionCell"
    private let imagesForWorkout: [String] = ["abs", "biceps", "dumbbells", "iron", "timer"]
    private var selectedImage: UIImage?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        setConfigure()
        setLayout()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Private methods
    
    private func setLayout() {
        collectionLayout.minimumInteritemSpacing = 3
    }
    
    private func setConfigure() {
        collectionLayout.scrollDirection = .horizontal
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        register(NewWorkoutCollectionCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    private func setDelegates() {
        delegate = self
        dataSource = self
    }
    
// MARK: - Public Methods
    
    public func getImage() -> UIImage? {
        selectedImage
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension NewWorkoutCollectionImages: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 80)
    }
}

// MARK: - UICollectionViewDelegate

extension NewWorkoutCollectionImages: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage = UIImage(named: imagesForWorkout[indexPath.item])
    }
}

// MARK: - UICollectionViewDataSource

extension NewWorkoutCollectionImages: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesForWorkout.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? NewWorkoutCollectionCell else { return UICollectionViewCell() }
        cell.setImage(imageName: imagesForWorkout[indexPath.item])
        return cell
    }
}

