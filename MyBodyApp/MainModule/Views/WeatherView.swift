//
//  WeatherView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 04.03.2023.
//

import UIKit

class WeatherView: UIView {
    
    private var weatherStatusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.textColor = .specialLightGray
        label.font = .robotoMedium14()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOfView()
        
        addSubview(weatherStatusImage)
        addSubview(weatherLabel)
        addSubview(descriptionLabel)
    }
    
}

extension WeatherView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherStatusImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherStatusImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherStatusImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            weatherStatusImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherStatusImage.leadingAnchor, constant: -10),
            weatherLabel.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            descriptionLabel.trailingAnchor.constraint(equalTo: weatherStatusImage.leadingAnchor, constant: -10)
        ])
    }
}
