//
//  Logo.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/8.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 102/255, green: 126/255, blue: 234/255), // #667eea
                            Color(red: 118/255, green: 75/255, blue: 162/255)   // #764ba2
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 80, height: 80)
            
            Text("M")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .bold))
        }
    }
}

#Preview{
    LogoView()
}
