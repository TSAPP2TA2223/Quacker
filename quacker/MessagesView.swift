//
//  MessagesView.swift
//  quacker
//
//  Created by Abby Dominguez on 3/11/22.
//

import SwiftUI

struct MessagesView: View {
    @State var selectedTab : Tabs = .chat
    @State private var currentView: String = "messages"
    var body: some View {
        switch(currentView){
        case "messages":
            ZStack{
                Color("ColorBackground")
                VStack{
                    Spacer()
                    Text("No new messages")
                        .foregroundColor(.brown)
                    Image(systemName: "envelope")
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
                            if selectedTab == Tabs.notifications{
                                currentView = "notification"
                            }
                        })
                }
            }
            .ignoresSafeArea()
        case "discovery":
            DiscoveryView()
        case "main":
            MainView()
        case "notification":
            NotificationView()
        default:
            ZStack{
                Color("ColorBackground")
                VStack{
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                        .onChange(of: selectedTab, perform: { newValue in
                            if selectedTab == Tabs.home{
                                currentView = "main"
                            }
                        })
                }
            }
            
            
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
