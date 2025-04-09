//
//  GeometryReader.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/9.
//

import SwiftUI


// 一个粒子模型
struct Particle: Identifiable {
    let id = UUID()
    let x: CGFloat     // 相对于屏幕宽度的归一化 X
    let y: CGFloat     // 相对于屏幕高度的归一化 Y
    let delay: Double
    var floating: Bool // 是否开始上漂动画
}

struct GeometryReaderView<Content:View>: View {
    
    // 让外部传入一段视图 (闭包)
    let content: () -> Content
    
    // 随机粒子数据
    @State private var particles: [Particle] = []
    
    // MARK: - 粒子初始化
    func initParticles(count: Int) {
        var newParticles: [Particle] = []
        for _ in 0..<count {
            let p = Particle(
                x: .random(in: 0...1),
                y: .random(in: 0.3...1),  // 避免开始就太靠顶部
                delay: Double.random(in: 0...3),
                floating: false
            )
            newParticles.append(p)
        }
        self.particles = newParticles
    }
    
    var body: some View {
        ZStack {
            // MARK: - 背景渐变
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 74/255, green: 144/255, blue: 226/255),
                                            Color(red: 53/255, green: 122/255, blue: 189/255)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            // MARK: - 粒子层
            GeometryReader { geo in
                ZStack(alignment: .center) {
                    ForEach(particles) { particle in
                        Circle()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .position(x: particle.x * geo.size.width,
                                      y: particle.y * geo.size.height)
                        // 让每个粒子做上浮 + 淡出的动画
                        // 简化示例：通过 offset + opacity 实现
                            .offset(y: particle.floating ? -geo.size.height : 0)
                            .opacity(particle.floating ? 0 : 1)
                            .animation(
                                .easeInOut(duration: 3.0)
                                .repeatForever(autoreverses: false)
                                .delay(particle.delay),
                                value: particle.floating
                            )
                    }
                    content()
                }.frame(width: geo.size.width, height: geo.size.height)
            }
        }.onAppear{
            // 1) 初始化粒子
            initParticles(count: 50)
            // 2) 开始粒子动画
            //   设置一个短暂延时以便让 onAppear 后再触发
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    // 将所有粒子的 floating 设为 true，触发飞行
                    for i in particles.indices {
                        particles[i].floating = true
                    }
                }
            }
        }
    }
}


#Preview {
    GeometryReaderView{
        VStack{}
    }
}
