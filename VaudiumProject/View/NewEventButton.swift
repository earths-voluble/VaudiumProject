//
//  NewEventButton.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/27.
//

import SwiftUI

struct NewEventButton: View {
    var body: some View {
        VStack {
            Button(action: {
                // 버튼이 클릭되었을 때 실행할 코드
                print("버튼이 클릭되었습니다.")
            }) {
                HStack {
                    Image(systemName: "star.fill") // 이미지를 사용할 경우
                    Text("New Event")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventButton()
    }
}
