//
//  SliderView.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 06.03.2023.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func somethingFunc(type: SliderType, value: Int)
}

class SliderView: UIView {
    
    weak var delegate: SliderViewProtocol?
    
    private var nameLabel = UILabel(text: "Name",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private var numberLabel = UILabel(text: "0",
                                      font: .robotoMedium24(),
                                      textColor: .specialGray)
    
    private var labelStack = UIStackView()
    
    private var greenSlider = GreenSlider()
    private var sliderType: SliderType?
    
    private var viewsStack = UIStackView()
    
    public var isActive: Bool = true {
        didSet {
            if self.isActive {
                nameLabel.alpha = 1
                numberLabel.alpha = 1
                greenSlider.alpha = 1
            } else {
                nameLabel.alpha = 0.5
                numberLabel.alpha = 0.5
                greenSlider.alpha = 0.5
                numberLabel.text = "0"
                greenSlider.value = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(minVal: Float, maxVal: Float, text: String, type: SliderType) {
        self.init()
        greenSlider.minimumValue = minVal
        greenSlider.maximumValue = maxVal
        nameLabel.text = text
        setViews()
        setConstraints()
        sliderType = type
    }
    
    private func setViews() {
        translatesAutoresizingMaskIntoConstraints = false
        greenSlider.addTarget(self, action: #selector(setChanges), for: .valueChanged)
        labelStack = UIStackView(arrangedView: [nameLabel, numberLabel],
                                 spacing: 10,
                                 axis: .horizontal)
        labelStack.distribution = .equalSpacing
        
        viewsStack = UIStackView(arrangedView: [labelStack, greenSlider],
                                 spacing: 10,
                                 axis: .vertical)
        
        addSubview(viewsStack)
    }
    
    public func resetValues() {
        numberLabel.text = "0"
        greenSlider.value = 0
        isActive = true
    }
    
    @objc private func setChanges() {
        let intValue = Int(greenSlider.value)
        
        numberLabel.text = sliderType == .timer ? intValue.getTimeFromSeconds() : "\(intValue)"
        guard let type = sliderType else { return }
        delegate?.somethingFunc(type: type, value: intValue)
        
        
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
