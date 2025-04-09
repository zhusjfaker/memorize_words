//
//  TopSection.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/3/26.
//
import SwiftUI

struct TopSection: View {
    var body: some View {
        VStack(spacing: 16) {
            // 圆形 Logo
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [
                        Color(red: 102/255, green: 126/255, blue: 234/255), // #667eea
                        Color(red: 118/255, green: 75/255,  blue: 162/255)  // #764ba2
                    ]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 80, height: 80)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                
                Text("M")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            }
            
            // App 名称
            Text("记忆单词")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(red: 45/255, green: 55/255, blue: 72/255)) // #2d3748
            
            // 欢迎文案
            Text("开启你的单词学习之旅")
                .font(.system(size: 16))
                .foregroundColor(Color(red: 113/255, green: 128/255, blue: 150/255)) // #718096
        }
        .padding(.top, 20)
    }
}

#Preview{
    TopSection()
}
