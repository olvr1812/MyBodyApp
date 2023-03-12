//
//  Date + Extension.swift
//  MyBodyApp
//
//  Created by Оливер Салихов on 08.03.2023.
//

import UIKit

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
    
    func getLocaleTimeZone() -> Date {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        let localeDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: self) ?? Date()
        return localeDate
    }
    
    func getNameAndNumberOfWeekday() -> [[String]] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var weekdaysArray: [[String]] = [[], []]
        
        for i in -6...0 {
            let date = calendar.date(byAdding: .day, value: i, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            weekdaysArray[0].append("\(day)")
            
            let weekday = dateFormatter.string(from: date)
            weekdaysArray[1].append(weekday)
        }
        
        return weekdaysArray
    }
    
    func offsetDays(day: Int) -> Date {
        let offsetDay = Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
        return offsetDay
    }
}
