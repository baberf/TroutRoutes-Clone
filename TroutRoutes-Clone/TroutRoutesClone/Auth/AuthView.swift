//
//  AuthView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI

struct AuthView: View {
    @EnvironmentObject var nav: NavigationRouter
    @EnvironmentObject var authVM: AuthViewModel
    @State var isLogin: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AuthViewFields(isLogin: $isLogin, authVM: authVM)
        }
        .padding(.horizontal, 16)
        .navigationTitle(isLogin ? "Log In with Email" : "Create an Account")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    nav.popLast()
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }
}

struct AuthViewFields: View {
    @Binding public var isLogin: Bool
    @ObservedObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var verifyPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(isLogin ? "Don't have an account?": "Have an account?")
                    .font(.system(size: 14))
                Button {
                    isLogin.toggle()
                } label: {
                    Text(isLogin ? " Create Account" : " Login")
                        .font(.system(size: 14))
                        .tint(.black)
                        .underline()
                }
                Spacer()
            }
            .padding(.bottom, 24)
            
            AuthTextField {
                TextField("Email", text: $email)
            }
            
            AuthTextField {
                SecureField("Password", text: $password)
            }
            
            if !isLogin {
                AuthTextField {
                    SecureField("Verify Password", text: $verifyPassword)
                }
            }
            
            Button {
                if isLogin {
                    authVM.signIn(email: email, password: password, showErrorModal: showErrorModal)
                } else {
                    if password == verifyPassword {
                        authVM.signUp(email: email, password: password, showErrorModal: showErrorModal)
                    } else {
                        alertMessage = "Passwords must be the same"
                        showingAlert = true
                    }
                }
            } label: {
                VStack(alignment: .center, spacing: 0) {
                    Text(isLogin ? "Log In" : "Create Account")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .heavy))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(.blue)
                .cornerRadius(4)
                .padding(.bottom, 16)
            }
            .disabled(email.isEmpty ? true : false)
            
            HStack {
                Spacer()
                Button {
                    openURL(URL(string: "https://www.onxmaps.com/tou")!)
                } label: {
                    Text("Terms of Use")
                        .font(.system(size: 14))
                        .tint(.black)
                        .underline()
                }
                Spacer()
            }

            Spacer()
        }
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func showErrorModal(errorMessage: String) {
        showingAlert = true
        self.alertMessage = errorMessage
    }
}

struct AuthTextField<Content: View>: View {
    let textField: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            textField()
                .padding(.leading, 6)
        }
        .frame(height: 40)
        .background(Color(.systemGray6))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray3), lineWidth: 2)
        )
        .padding(.bottom, 16)
    }
}
