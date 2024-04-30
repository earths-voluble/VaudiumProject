//
//  EventBarView.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/19.
//

import SwiftUI

// EventBarView는 해당 월을 전달받고, Z스택 위에 표시할 바를 생성한다.

struct EventBarView: View {
    var width: CGFloat
    var height: CGFloat
    
    let columns: Int = 7
    let rows: Int = 5
    
    let objects: [String] = ["Object 1", "Object 2", "Object 3", "Object 4", "Object 5", "Object 6", "Object 7", "Object 8", "Object 9", "Object 10", "Object 11", "Object 12", "Object 13", "Object 14", "Object 15", "Object 16", "Object 17", "Object 18", "Object 19", "Object 20", "Object 21", "Object 22", "Object 23", "Object 24", "Object 25", "Object 26", "Object 27", "Object 28", "Object 29", "Object 30", "Object 31", "Object 32", "Object 33", "Object 34", "Object 35"]
    
    var body: some View {
        //    EventBar(superViewWidth: width, superViewHeight: height)
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { rowIndex in
                HStack(spacing: 0) {
                    ForEach(0..<self.columns, id: \.self) { columnIndex in
                        //          EventBar(superViewWidth: width, superViewHeight: height)
                        //              .frame(width: self.width / CGFloat(self.columns), height: self.height / CGFloat(self.rows))
                        
                        GridItemView(object: self.objects[rowIndex * self.columns + columnIndex])
                            .frame(width: self.width / CGFloat(self.columns), height: self.height / CGFloat(self.rows))
                    }
                }
            }
        }
    }
}

struct GridItemView: View {
    @State private var isModalPresented = false
    let object: String
    
    var body: some View {
        Text(object)
            .font(.system(size: 5))
            .frame(maxWidth: .infinity, maxHeight: 5)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .onTapGesture {
                self.isModalPresented = true
            }
            .sheet(isPresented: $isModalPresented) {
                // 모달 내용
                NewEventModalView()
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.7)
            }
    }
    
}

extension EventBarView {
    func findEventBar() {
        
    }
}

#Preview {
    EventBarView(width: 300, height: 300)
}
