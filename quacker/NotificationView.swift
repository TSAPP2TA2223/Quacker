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
                    List(0 ..< 15) {
                        item in HStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("Username")
                                Text("Notification")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding(20)
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
