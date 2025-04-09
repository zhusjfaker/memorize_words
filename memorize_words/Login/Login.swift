//
//  Login.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/10.
//

import SwiftUI
import common

struct LoginView:View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isLoggedIn = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    
    var body: some View {
        NavigationView {
            ZStack{
                BackgroundView()
                VStack{
                    Spacer()
                    VStack(spacing: 25) {
                        
                        LogoView().padding(.top, 30)
                        
                        // Title
                        Text("记忆单词")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.black)
                        
                        Text("让学习更简单，让记忆更高效")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        // Login Form
                        VStack(spacing: 20) {
                            // Username
                            VStack(alignment: .leading, spacing: 8) {
                                Text("用户名")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $username)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    )
                                    .modifier(PlaceholderStyle(text:$username,placeholder:"请输入用户名"))
                            }
                            
                            // Password
                            VStack(alignment: .leading, spacing: 8) {
                                Text("密码")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                
                                SecureField("", text: $password)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    )
                                    .modifier(PlaceholderStyle(text:$password,placeholder:"请输入密码"))
                            }
                            
                            // Remember Me
                            Toggle(isOn: $rememberMe) {
                                Text("记住我")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: Color(hex: "4a90e2")))
                            
                            
                            // Login Button
                            Button(action: {
                                // 在此处理注册逻辑
                            }){
                                Text("登录")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "4a90e2"), Color(hex: "357abd")]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(10)
                            }
                        }.padding(.horizontal, 30)
                        
                        // Register Link
                        HStack {
                            Text("还没有账号？")
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: RegisterView()) {
                                Text("立即注册")
                                    .foregroundColor(Color(hex: "4a90e2"))
                                    .fontWeight(.semibold)
                            }
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
                    .padding(.horizontal, 24)
                    Spacer()
                }
            }}.navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}

