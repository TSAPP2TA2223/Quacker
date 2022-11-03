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
                    CustomTabBar(selectedTab: $selectedTab)
                        .onChange(of: selectedTab, perform: { newValue in
                            if selectedTab == Tabs.home{
                                currentView = "main"
                            }
                        })
                }
            }
            .ignoresSafeArea()
        case "discovery":
            DiscoveryView()
        case "main":
            MainView()
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
