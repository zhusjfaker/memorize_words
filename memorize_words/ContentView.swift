//
//  ContentView.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // 1. 背景渐变
            BackgroundView()
            VStack {
                // 2. 顶部区域
                TopSection()
                Spacer()
                WordMenuView()
                Spacer()
                BottomSection()
            }
            .padding(.vertical, 30) // 上下留间距
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ContentView()
}
