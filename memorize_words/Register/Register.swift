//
//  Register.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/8.
//


import SwiftUI

struct RegisterForm:View {
    
    // 这里使用 @State 管理用户的输入和复选框状态
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var agreedToTerms: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            // 用户名
            VStack(alignment: .leading, spacing: 4) {
                Text("用户名")
                    .font(.subheadline)
                    .foregroundColor(.black)
                TextField("", text: $username)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .modifier(PlaceholderStyle(text:$username,placeholder:"请设置用户名"))
            }
            
            // 邮箱
            VStack(alignment: .leading, spacing: 4) {
                Text("邮箱")
                    .font(.subheadline)
                    .foregroundColor(.black)
                TextField("", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .modifier(PlaceholderStyle(text:$email,placeholder:"请输入邮箱"))
            }
            
            // 密码
            VStack(alignment: .leading, spacing: 4) {
                Text("密码")
                    .font(.subheadline)
                    .foregroundColor(.black)
                SecureField("", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .modifier(PlaceholderStyle(text:$password,placeholder:"请设置密码"))
            }
            
            // 确认密码
            VStack(alignment: .leading, spacing: 4) {
                Text("确认密码")
                    .font(.subheadline)
                    .foregroundColor(.black)
                SecureField("", text: $confirmPassword)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .modifier(PlaceholderStyle(text:$confirmPassword,placeholder:"请再次输入密码"))
            }
            // 同意条款复选框
            HStack(alignment: .center, spacing: 10) {
                // SwiftUI 没有原生的“复选框”控件，可以使用 Toggle 或 Picker 等自定义
                // 这里使用 Toggle 来模拟复选框效果
                Toggle("", isOn: $agreedToTerms)
                    .labelsHidden()
                    .toggleStyle(CheckboxStyle()) // 下面自定义的 CheckboxStyle
                
                Text("我已阅读并同意")
                    .foregroundColor(.gray)
                    .font(.footnote)
                +
                Text("服务条款")
                    .foregroundColor(.blue)
                    .font(.footnote)
                +
                Text("和")
                    .foregroundColor(.gray)
                    .font(.footnote)
                +
                Text("隐私政策")
                    .foregroundColor(.blue)
                    .font(.footnote)
            }
            
            // 注册按钮
            Button(action: {
                // 在此处理注册逻辑
            }) {
                Text("注册")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 74/255, green: 144/255, blue: 226/255),  // #4a90e2
                                Color(red: 53/255, green: 122/255, blue: 189/255)   // #357abd
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(8)
                    .shadow(radius: 2)
            }
            .disabled(!agreedToTerms)
        }.padding(.horizontal, 10)
    }
}


struct RegisterView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView{
                VStack{
                    Spacer().frame(height: 40)
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            LogoView()
                            Text("创建账号")
                                .font(.title)
                                .foregroundColor(.black)
                            
                            Text("加入我们的学习社区")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                    // 表单
                    RegisterForm()
                    // 底部登录链接
                    VStack(spacing: 8) {
                        Divider()
                        HStack {
                            Text("已有账号？")
                                .foregroundColor(.gray)
                                .font(.footnote)
                            
                            NavigationLink(destination: LoginView()) {
                                Text("立即登录")
                                    .foregroundColor(.blue)
                                    .font(.footnote)
                            }
                        }
                    }
                    
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal, 16)
            }
        }.navigationBarHidden(true)
    }
}

#Preview{
    RegisterView()
}
