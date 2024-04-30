//
//  ContentView.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/18.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
//  @Query var Events: [Event]
  @State var CalendarViewHeight: CGFloat = 0
  @State var CalendarViewWidth: CGFloat = 0
  
  @State var month: Date = Date()
  @State var clickedCurrentMonthDates: Date?
  
  init(
    // 월은 Date, 초기값으로 현재 월
    month: Date = Date(),
    clickedCurrentMonthDates: Date? = nil
  ) {
    _month = State(initialValue: month)
    _clickedCurrentMonthDates = State(initialValue: clickedCurrentMonthDates)
  }
  
  var body: some View {
    GeometryReader { geo in
      NavigationStack {
        ZStack {
          VStack {
            headerView
              .frame(height: 50)
            calendarGridView
            Spacer()
          }
          VStack {
            Spacer()
            HStack {
              Spacer()
              NewEventButton()
            }
          }
        }
        .onAppear {
          self.CalendarViewHeight = geo.size.height - 50
          self.CalendarViewWidth = geo.size.width
        }
        .navigationTitle("")
        .toolbarBackground(Color.black, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        
      }
    }
  }
  

  // MARK: - 헤더 뷰
  private var headerView: some View {
    VStack {
      HStack {
        Spacer()
      }
      .padding(.horizontal, 10)
      .padding(.bottom, 5)
      HStack {
        ForEach(Self.weekdaySymbols.indices, id: \.self) { symbol in
          Text(Self.weekdaySymbols[symbol].uppercased())
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
        }
      }
      .padding(.bottom, 5)
    }
  }
  
  // MARK: - 연월 표시
  private var yearMonthView: some View {
    HStack(alignment: .center, spacing: 20) {
      Button(
        action: {
          changeMonth(by: -1)
        },
        label: {
          Image(systemName: "chevron.left")
            .font(.title)
            .foregroundColor(canMoveToPreviousMonth() ? .black : .gray)
        }
      )
      .disabled(!canMoveToPreviousMonth())
      
      Text(month, formatter: Self.calendarHeaderDateFormatter)
        .font(.title.bold())
      
      Button(
        action: {
          changeMonth(by: 1)
        },
        label: {
          Image(systemName: "chevron.right")
            .font(.title)
            .foregroundColor(canMoveToNextMonth() ? .black : .gray)
        }
      )
      .disabled(!canMoveToNextMonth())
    }
  }
  
  // MARK: - 날짜 그리드 뷰
  private var calendarGridView: some View {
    let daysInMonth: Int = numberOfDays(in: month)
    let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
    let lastDayOfMonthBefore = numberOfDays(in: previousMonth())
    let numberOfRows = Int(ceil(Double(daysInMonth + firstWeekday) / 7.0))
    let visibleDaysOfNextMonth = numberOfRows * 7 - (daysInMonth + firstWeekday)
    
    return LazyVGrid(
      columns: Array(repeating: GridItem(), count: 7),
      spacing: 0
    ) {
      ForEach(-firstWeekday ..< daysInMonth + visibleDaysOfNextMonth, id: \.self) { index in
        Group {
          if index > -1 && index < daysInMonth {
            let date = getDate(for: index)
            let day = Calendar.current.component(.day, from: date)
            let clicked = clickedCurrentMonthDates == date
            let isToday = date.formattedCalendarDayDate == today.formattedCalendarDayDate
            
            CalendarCellView(day: day, clicked: clicked, isToday: isToday)
              .frame(width: CalendarViewWidth / 7, height: CalendarViewHeight / 5)
            
          } else if let prevMonthDate = Calendar.current.date(
            byAdding: .day,
            value: index + lastDayOfMonthBefore,
            to: previousMonth()
          ) {
            let day = Calendar.current.component(.day, from: prevMonthDate)
            
            CalendarCellView(day: day, isCurrentMonthDay: false)
              .frame(width: CalendarViewWidth / 7, height: CalendarViewHeight / 5)
          }
        }
        .onTapGesture {
          if 0 <= index && index < daysInMonth {
            let date = getDate(for: index)
            clickedCurrentMonthDates = date
          }
        }
      }
    }
  }
}

#Preview {
  CalendarView()
}
