//
//  UIViewController + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 12.03.2023.
//

import UIKit

extension UIViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addGestures() {
        let tapView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapView.cancelsTouchesInView = false
        view.addGestureRecognizer(tapView)
        
        let swipeView = UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        swipeView.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeView)
    }
    
    func presentAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
