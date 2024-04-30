//
//  EventBar.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/19.
//

import SwiftUI

struct EventBar: View {
    var superViewWidth: CGFloat
    var superViewHeight: CGFloat
    
    var body: some View {
        let width = superViewWidth
        let height = superViewHeight
        
        RoundedRectangle(cornerRadius: 3)
            .fill(Color.blue)
            .frame(width: width, height: height)
    }
}
