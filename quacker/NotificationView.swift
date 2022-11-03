//
//  DiscoveryView.swift
//  quacker
//
//  Created by Abby Dominguez on 3/11/22.
//

import SwiftUI

struct NotificationView: View {
    @State var selectedTab : Tabs = .notifications
    @State private var currentView: String = "notification"
    var body: some View {
        switch(currentView){
        case "notification":
            ZStack{
                Color("ColorBackground")
                VStack{
                    Spacer()
                    Text("No new notifications")
                        .foregroundColor(.brown)
                    Image(systemName: "bell")
                        .foregroundColor(.brown)
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .onChange(of: selectedTab, perform: { newValue in
                            if selectedTab == Tabs.home{
                                currentView = "main"
                            }
                            if selectedTab == Tabs.discover{
                                currentView = "discovery"
                            }
                            if selectedTab == Tabs.chat{
                                currentView = "messages"
                            }
                        })
                }
            }
            .ignoresSafeArea()
        case "discovery":
            DiscoveryView()
        case "messages":
            MessagesView()
        case "main":
            MainView()
        default:
            NotificationView()
        }
    }
}

struct NotificationVoew_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
