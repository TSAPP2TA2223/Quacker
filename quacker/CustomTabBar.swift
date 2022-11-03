//
//  CustomTabBar.swift
//  quacker
//
//  Created by Diego Moreno on 2/11/22.
//

import SwiftUI

enum Tabs : Int {
    case home = 0
    case discover = 1
    case notifications = 2
    case chat = 3
}
struct CustomTabBar: View {
    
    @Binding var selectedTab : Tabs 
    var body: some View {
        ZStack{
            Color("ColorBackground")
            HStack (alignment: .center) {
                //HOME
                Button {
                    selectedTab = .home
                } label: {
                    TabBarButton(imageName: "house", isActive: selectedTab == .home)
                }
                .tint(.yellow)
                //DISCOVER
                Button {
                    selectedTab = .discover
                } label: {
                    TabBarButton(imageName: "magnifyingglass", isActive: selectedTab == .discover)
                }
                .tint(.yellow)
                //NOTIFICATIONS
                Button {
                    selectedTab = .notifications
                } label: {
                    TabBarButton(imageName: "bell", isActive: selectedTab == .notifications)
                }
                .tint(.yellow)
                //CHAT
                Button {
                    selectedTab = .chat
                } label: {
                    TabBarButton(imageName: "envelope", isActive: selectedTab == .chat)
                }
                .tint(.yellow)
            }
            
        }.frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home))
    }
}
