//
//  SplashContent.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/9.
//

import SwiftUI

struct SplashContent:View{
    
    // 用于控制标题和副标题出现的动画
    @State private var showTitle: Bool = false
    @State private var showSubtitle: Bool = false
    
    // 控制进度条动画
    @State private var progress: CGFloat = 0.0
    
    // 控制“图标”上下浮动
    @State private var iconOffset: CGFloat = 0
    //    @State private var floatDirection: CGFloat = 1
    
    // Timer 控制
    @State private var timer: Timer?
    
    var body: some View{
        // MARK: - 内容
        VStack(spacing: 20) {
            // 图标
            Image(systemName: "brain.head.profile") // 替换成你需要的图标,或使用自定义图片
                .font(.system(size: 80))
                .foregroundColor(.white)
                .offset(y: iconOffset)
                .onAppear{
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)){
                        iconOffset = -20
                    }
                }
            
            // 标题
            Text("记忆单词")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .opacity(showTitle ? 1 : 0)
                .offset(y: showTitle ? 0 : 20)
                .onAppear {
                    // 当视图出现后，再用显式动画来修改 showTitle
                    withAnimation(.easeOut.delay(0.5)) {
                        showTitle = true
                    }
                }
            
            // 副标题
            Text("让学习更简单，让记忆更高效")
                .font(.system(size: 18))
                .foregroundColor(.white.opacity(0.9))
                .opacity(showSubtitle ? 1 : 0)
                .offset(y: showSubtitle ? 0 : 20)
                .onAppear{
                    // 当视图出现后，再用显式动画来修改 showTitle
                    withAnimation(.easeOut.delay(1.0)) {
                        showSubtitle = true
                    }
                }
            
            // 进度条
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 200, height: 4)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white)
                    .frame(width: 200 * progress, height: 4)
            }
            .padding(.top, 20)
        }.onAppear{
            
            
            // 5) 进度条从 0 -> 1
            withAnimation(.linear(duration: 4.0)) {
                progress = 1.0
            }
        }
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()    // 让蓝色铺满安全区外部
        SplashContent()
        //            .border(Color.red)
    }
}
