//
//  CellView.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/18.
//

import SwiftUI

struct CalendarCellView: View {
  private var day: Int
  private var clicked: Bool
  private var isToday: Bool
  private var isCurrentMonthDay: Bool
  private var textColor: Color {
    if clicked {
      return Color.white
    } else if isCurrentMonthDay {
      return Color.black
    } else {
      return Color.gray
    }
  }
  private var backgroundColor: Color {
    if clicked {
      return Color.black
    } else if isToday {
      return Color.gray
    } else {
      return Color.white
    }
  }
  
  init(
    day: Int,
    clicked: Bool = false,
    isToday: Bool = false,
    isCurrentMonthDay: Bool = true
  ) {
    self.day = day
    self.clicked = clicked
    self.isToday = isToday
    self.isCurrentMonthDay = isCurrentMonthDay
  }
  
  var body: some View {
    VStack {
      if clicked {
        RoundedRectangle(cornerRadius: 5)
          .fill(.blue)
          .overlay(
            Text(String(day)).foregroundStyle(.white),
            alignment: .top
          )
          .foregroundColor(backgroundColor)
      } else {
        RoundedRectangle(cornerRadius: 5)
          .fill(backgroundColor)
          .overlay(
            Text(String(day)),
            alignment: .top
          )
          .foregroundColor(textColor)
      }
    }
    .frame(height: 80)
  }
}

#Preview {
  CalendarCellView(day: 31)
}
