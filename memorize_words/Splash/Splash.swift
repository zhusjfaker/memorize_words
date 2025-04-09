//
//  Splash.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/9.
//

import SwiftUI


struct SplashView:View {
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack{
                GeometryReaderView{
                    SplashContent().frame(height: 400)
                }
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    navigationPath.append("login")
                }
                
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "login" {
                    LoginView()
                }
            }
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    SplashView()
}
