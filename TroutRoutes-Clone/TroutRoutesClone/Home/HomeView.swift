//
//  HomeView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI

struct BottomBarItem {
    let title: String
    let iconName: String
}

struct HomeView: View {
    @State private var showSidebar = false
    @State private var presentSheet = false
    @State private var sheetTitle = ""
    let bottomBarItems = [BottomBarItem(title: "Map Layers", iconName: "square.stack.3d.up.fill"), BottomBarItem(title: "My Content", iconName: "folder.fill"), BottomBarItem(title: "Create", iconName: "plus.circle.fill"), BottomBarItem(title: "Map Legend", iconName: "rectangle.split.2x1.fill"), BottomBarItem(title: "Filters", iconName: "slider.vertical.3")]
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(alignment: .center, spacing: 0) {
                    MapView()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Button {
                                showSidebar = true
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .tint(.black)
                                    .font(Font.title.weight(.bold))
                            }
                            
                            Spacer()
                            
                            Text("Clone by Baber Farrukh")
                            
                            Spacer()
                            
                            Button {
                                print("Basic")
                            } label: {
                                Text("Basic")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color(.systemGray3))
                                    .cornerRadius(4)
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            ForEach(bottomBarItems, id: \.title) { bottomBarItem in
                                Button {
                                    sheetTitle = bottomBarItem.title
                                } label: {
                                    VStack(alignment: .center, spacing: 0) {
                                        Image(systemName: bottomBarItem.iconName)
                                            .frame(width: 50, height: 50)
                                            .tint(.gray)
                                        Text(bottomBarItem.title)
                                            .font(.system(size: 10))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
                .toolbarBackground(Color(.systemGray6), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color(.systemGray6), for: .bottomBar)
                .toolbarBackground(.visible, for: .bottomBar)
            }
            .onChange(of: sheetTitle, { _, _ in
                presentSheet = true
            })
            .sheet(isPresented: $presentSheet) {
                VStack(spacing: 0) {
                    Divider()
                        .frame(width: 100)
                        .frame(height: 4)
                        .overlay(.gray)
                        .padding(.top, 10)
                        .padding(.bottom, 16)
                    HStack {
                        Text(sheetTitle)
                            .font(.headline)
                            .padding(.leading, 16)
                        Spacer()
                    }
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .presentationDetents([.fraction(0.3)])
            }
            
            if showSidebar {
                SideBarView(showSidebar: $showSidebar)
            }
        }
    }
}
