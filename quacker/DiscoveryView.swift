//
//  DiscoveryView.swift
//  quacker
//
//  Created by Abby Dominguez on 3/11/22.
//

import SwiftUI

struct DiscoveryView: View {
    @State var selectedTab : Tabs = .discover
    @State private var currentView: String = "discovery"
    var body: some View {
        switch(currentView){
        case "discovery":
            ZStack{
                Color("ColorBackground")
                VStack{
                    Spacer()
                    Text("DISCOVERY VIEW")
                        .foregroundColor(.brown)
                    Image(systemName: "globe.europe.africa")
                        .foregroundColor(.brown)
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .onChange(of: selectedTab, perform: { newValue in
                            if selectedTab == Tabs.home{
                                currentView = "main"
                            }
                            if selectedTab == Tabs.notifications{
                                currentView = "notification"
                            }
                            if selectedTab == Tabs.chat{
                                currentView = "messages"
                            }
                        })
                }
            }
            .ignoresSafeArea()
        case "messages":
            MessagesView()
        case "main":
            MainView()
        case "notification":
            NotificationView()
        default:
            DiscoveryView()
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
