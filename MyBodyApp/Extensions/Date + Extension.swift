//
//  Date + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 08.03.2023.
//

import UIKit

extension Date {
    
    func getWeekDaayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
