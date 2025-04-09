//
//  BottomSection.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/3/26.
//
import SwiftUI

// MARK: - 底部按钮
struct BottomSection: View {
    var body: some View {
        Button(action: {
            // TODO: 实际的开始学习动作
        }) {
            Text("开始学习")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .padding(.horizontal, 36)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(gradient: Gradient(colors: [
                        Color(red: 102/255, green: 126/255, blue: 234/255),
                        Color(red: 118/255, green: 75/255,  blue: 162/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                )
                .cornerRadius(50)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    BottomSection()
}
