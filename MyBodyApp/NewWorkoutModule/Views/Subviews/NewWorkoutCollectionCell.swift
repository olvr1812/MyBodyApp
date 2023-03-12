//
//  NewWorkoutCollectionCell.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 12.03.2023.
//

import UIKit

class NewWorkoutCollectionCell: UICollectionViewCell {
    
    private var imageOfNewWorkout: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfigure() {
        layer.cornerRadius = 10
        addSubview(imageOfNewWorkout)
    }
    
    public func setImage(imageName: String) {
        imageOfNewWorkout.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialGreen
                imageOfNewWorkout.tintColor = .specialYellow
            } else {
                backgroundColor = .specialBrown
                imageOfNewWorkout.tintColor = .specialBlack
            }
        }
    }

}

//MARK: - Constraints

extension NewWorkoutCollectionCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageOfNewWorkout.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageOfNewWorkout.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageOfNewWorkout.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfNewWorkout.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}


