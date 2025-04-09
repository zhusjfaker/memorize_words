//
//  TextField.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/13.
//

import SwiftUI
import common

// 1. 首先定义一个自定义的 ViewModifier
struct PlaceholderStyle: ViewModifier {
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var placeholder: String
    var need_focus: Bool = false
    
    var show: Bool {
        if need_focus{
            text.isEmpty && !isFocused
        }else{
            text.isEmpty
        }
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show {
                Text(placeholder)
                    .foregroundColor(Color(hex: "#999999"))
                    .padding(.leading,15)
            }
            content.focused($isFocused).foregroundColor(.black)
        }
    }
}

private struct DemoView:View {
    
    @State  var username = ""
    
    var body: some View {
        VStack{
            TextField("", text: $username)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .modifier(PlaceholderStyle(text: $username, placeholder:"请输入用户名"))
            TextField("", text: $username)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .modifier(PlaceholderStyle(text: $username, placeholder:"请输入密码",need_focus:true))
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        .padding(.horizontal, 24)
    }
}

#Preview{
    DemoView()
}
