//
//  ContentView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @StateObject var authVM = AuthViewModel()
    @StateObject var nav = NavigationRouter()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        if !authVM.isSignedIn {
            NavigationStack(path: $nav.path) {
                LandingView()
                .navigationDestination(for: NavigationRoutes.self) { route in
                    switch route {
                    case .login:
                        AuthView(isLogin: true)
                    case .createAccount:
                        AuthView(isLogin: false)
                    }
                }
            }
            .environmentObject(nav)
            .environmentObject(authVM)
            
        } else {
            HomeView()
                .environmentObject(authVM)
        }
    }
}

