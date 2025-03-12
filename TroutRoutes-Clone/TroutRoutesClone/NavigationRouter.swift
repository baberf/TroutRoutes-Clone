//
//  NavigationRouter.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI

enum NavigationRoutes {
    case login
    case createAccount
}

class NavigationRouter: ObservableObject {

    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func popLast() {
        path.removeLast()
    }
}
