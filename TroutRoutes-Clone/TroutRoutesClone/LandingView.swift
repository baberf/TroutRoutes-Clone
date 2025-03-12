//
//  LandingView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI

struct LandingView: View {
    
    private let lineItems = ["All streams in the lower 48", "Stream Ratings", "Offline Maps", "Real-time flows, heights, temps", "Public access points", "Private Custom Markers"]
    
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.85)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Image("logoWhite")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 32)
                
                HStack {
                    VStack {
                        Divider()
                            .frame(height: 2)
                            .overlay(.white)
                    }
                    Text("Clone by Baber Farrukh")
                        .font(.system(size: 16, weight: .heavy))
                        .fixedSize()
                        .foregroundColor(.white)
                    VStack {
                        Divider()
                            .frame(height: 2)
                            .overlay(.white)
                    }
                }
                .padding(.bottom, 32)
                
                ForEach(lineItems, id: \.self) { lineItem in
                    Text(lineItem)
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    AuthButton(text: "Create Account", route: .createAccount, background: .blue)
                    
                    HStack {
                        VStack {
                            Divider()
                                .overlay(.white)
                        }
                        Text("OR")
                            .font(.system(size: 14, weight: .heavy))
                            .fixedSize()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                        VStack {
                            Divider()
                                .overlay(.white)
                        }
                    }
                    .padding(.vertical, 16)
                    
                    AuthButton(text: "Login", route: .login, background: .gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 32)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
        }
    }
}

struct AuthButton: View {
    let text: String
    let route: NavigationRoutes
    let background: Color
    
    var body: some View {
        NavigationLink(value: route) {
            Text(text)
                .font(.system(size: 16, weight: .heavy))
                .foregroundColor(.white)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(background)
                .cornerRadius(6)
        }
    }
}
