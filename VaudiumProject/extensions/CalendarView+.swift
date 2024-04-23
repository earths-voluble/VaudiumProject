//
//  CalendarView+.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/18.
//

import SwiftUI

// MARK: - Properties
extension CalendarView {
  var today: Date {
    let now = Date()
    let components = Calendar.current.dateComponents([.year, .month, .day], from: now)
    return Calendar.current.date(from: components)!
  }
  
  static let calendarHeaderDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY.MM"
    return formatter
  }()
  
  static let weekdaySymbols: [String] = Calendar.current.shortWeekdaySymbols
}

// MARK: - Methods
extension CalendarView {
  func getDate(for index: Int) -> Date {
    let calendar = Calendar.current
    guard let firstDayOfMonth = calendar.date (
      from: DateComponents(
        year: calendar.component(.year, from: month),
        month: calendar.component(.month, from: month),
        day: 1
      )
    ) else {
      return Date()
    }
    
    var dateComponents = DateComponents()
    dateComponents.day = index
    
    let timeZone = TimeZone.current
    let offset = Double(timeZone.secondsFromGMT(for: firstDayOfMonth))
    dateComponents.second = Int(offset)
    
    let date = calendar.date(byAdding: dateComponents, to: firstDayOfMonth) ?? Date()
    return date
  }
  
  func numberOfDays(in date: Date) -> Int {
    return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
  }
  
  func firstWeekdayOfMonth(in date: Date) -> Int {
    let components = Calendar.current.dateComponents([.year, .month], from: date)
    let firstDayOfMonth = Calendar.current.date(from: components)!
    
    return Calendar.current.component(.weekday, from: firstDayOfMonth)
  }
  
  func previousMonth() -> Date {
    let components = Calendar.current.dateComponents([.year, .month], from: month)
    let firstDayOfMonth = Calendar.current.date(from: components)!
    let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: firstDayOfMonth)!
    return previousMonth
  }
  
  func changeMonth(by value: Int) {
    self.month = adjustedMonth(by: value)
  }
  
  func canMoveToPreviousMonth() -> Bool {
    let currentDate = Date()
    let calendar = Calendar.current
    let targetDate = calendar.date(byAdding: .year, value: 30, to: currentDate) ?? currentDate
    
    if adjustedMonth(by: -1) < targetDate {
      return false
    }
    return true
  }
  
  func canMoveToNextMonth() -> Bool {
    let currentDate = Date()
    let calendar = Calendar.current
    let targetDate = calendar.date(byAdding: .year, value: 30, to: currentDate) ?? currentDate
    
    if adjustedMonth(by: 1) > targetDate {
      return false
    }
    return true
  }
  
  func adjustedMonth(by value: Int) -> Date {
    if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: month) {
      return newMonth
    }
    return month
  }
}
