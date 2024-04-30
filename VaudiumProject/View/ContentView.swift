//
//  ContentView.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      TabView {
        // 첫 번째 탭
        CalendarView()
          .tabItem {
            Image(systemName: "calendar")
            Text("캘린더")
          }
        
        // 두 번째 탭
        Text("두 번째 탭 컨텐츠")
          .tabItem {
            Image(systemName: "person")
            Text("프로필")
          }
      }
      .navigationTitle("VaudiumProject")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("알람") {
            // 알람 버튼 액션
          }
        }
      }
    }
  }
}


