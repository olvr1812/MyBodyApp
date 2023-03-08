//
//  SliderView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

class SliderView: UIView {
    
    private var nameLabel = UILabel(text: "Name",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private var numberLabel = UILabel(text: "0",
                                      font: .robotoMedium24(),
                                      textColor: .specialGray)
    
    private var labelStack = UIStackView()
    
    private var greenSlider = GreenSlider()
    
    private var viewsStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(minVal: Float, maxVal: Float, text: String) {
        self.init()
        greenSlider.minimumValue = minVal
        greenSlider.maximumValue = maxVal
        nameLabel.text = text
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        translatesAutoresizingMaskIntoConstraints = false
        labelStack = UIStackView(arrangedView: [nameLabel, numberLabel],
                                 spacing: 10,
                                 axis: .horizontal)
        labelStack.distribution = .equalSpacing
        
        viewsStack = UIStackView(arrangedView: [labelStack, greenSlider],
                                 spacing: 10,
                                 axis: .vertical)
        
        addSubview(viewsStack)
    }
}

extension SliderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            viewsStack.topAnchor.constraint(equalTo: topAnchor),
            viewsStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewsStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewsStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
