//
//  MenuView.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/2.
//

import SwiftUI
import common

struct WordMenuView: View {
    var body: some View {
        // 功能项
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            FeatureItem(icon: "book.fill", text: "智能记忆")
            FeatureItem(icon: "chart.line.uptrend.xyaxis", text: "学习进度")
            FeatureItem(icon: "gamecontroller.fill", text: "趣味游戏")
            FeatureItem(icon: "trophy.fill", text: "成就系统")
        }
        .padding(.horizontal, 40)
    }
    
}

struct FeatureItem: View {
    var icon: String
    var text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 45, height: 45)
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            Text(text)
                .font(.subheadline)
                .foregroundColor(Color(hex: "#4a5568"))
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.05), radius: 10)
    }
}



#Preview{
    WordMenuView()
}
