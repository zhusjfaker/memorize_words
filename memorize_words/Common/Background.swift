//
//  Background.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/8.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 245/255, green: 247/255, blue: 250/255), // #f5f7fa
            Color(red: 195/255, green: 207/255, blue: 226/255)  // #c3cfe2
        ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea() // 背景填满整个屏幕
    }
}

#Preview{
    BackgroundView()
}
