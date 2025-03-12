//
//  SideBarView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI

struct SideListItem {
    let title: String
    let iconName: String
}

struct SideBarView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.openURL) var openURL
    @Binding var showSidebar: Bool
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let sideListItems = [SideListItem(title: "My Account", iconName: "person"), SideListItem(title: "Help Center", iconName: "questionmark.circle"), SideListItem(title: "Share with Friends", iconName: "square.and.arrow.up"), SideListItem(title: "Check for Updates", iconName: "tray.and.arrow.down"), SideListItem(title: "Upgrade to Pro", iconName: "plus")]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Image("logoBlue")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 16)
                
                HStack {
                    Spacer()
                    Text("Version: \(appVersion ?? "")")
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
                .padding(.bottom, 6)
                
                VStack(alignment: .center) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .font(Font.title.weight(.ultraLight))
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                        .padding(.bottom, 24)
                    
                    HStack {
                        Text("Member Since:")
                            .font(.system(size: 12))
                        Spacer()
                        Text(Date().formatted(date: .numeric, time: .omitted))
                            .font(.system(size: 12))
                    }
                    .padding(.bottom, 12)
                    
                    HStack {
                        Text("Account:")
                        Spacer()
                        Text("Basic")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .background(Color(.systemGray2))
                            .cornerRadius(4)
                    }
                    .padding(.bottom, 6)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .background(Color(.systemGray4))
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(sideListItems, id: \.title) { sideListItem in
                        Button {
                            print(sideListItem.title)
                        } label: {
                            HStack(spacing: 0) {
                                Image(systemName: sideListItem.iconName)
                                    .frame(width: 50, height: 50)
                                    .tint(.gray)
                                Text(sideListItem.title)
                                    .foregroundColor(.black)
                            }
                        }
                        Divider()
                    }
                }
                .padding(.bottom, 16)
                
                Button {
                    openURL(URL(string: "https://www.onxmaps.com/tou")!)
                } label: {
                    Text("Terms of Use")
                        .font(.system(size: 14))
                        .tint(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                Button {
                    authVM.signOut()
                } label: {
                    HStack {
                        Image(systemName:"chevron.left.circle")
                            .tint(.black)
                        Text("Logout")
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 12)
                    .padding(.top, 12)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray4))
            }
            .frame(width: 230)
            .background(.white)
            
            VStack {
                Color.clear
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showSidebar = false
            }
        }
        .frame(maxWidth: .infinity)
        .background(.clear)
    }
}
