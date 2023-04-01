//
//  LoginView.swift
//  VK
//
//  Created by marinapolyakova on 01.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        if loginViewModel.isLogin{
            AppView()
                .environmentObject(loginViewModel)
        }else{
            WebView(token: $loginViewModel.token)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
