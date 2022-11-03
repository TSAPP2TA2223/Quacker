//
//  MainView.swift
//  quacker
//
//  Created by Diego Moreno on 30/10/22.
//

import SwiftUI
import Firebase

struct MainView: View {
    @EnvironmentObject var dataManager : DataManager
    @State var selectedTab : Tabs = .home
    var body: some View {
        ZStack{
            Color("ColorBackground")
        VStack {
            List(dataManager.quacks, id: \.id) { quack in
                HStack {
                    Image(systemName: "photo")
                    VStack(alignment: .leading) {
                        Text(quack.owner)
                        Text(quack.contents)
                            .font(.subheadline)
                    }
                }
            }
            HStack{
                Spacer()
                Button {
                    //TODO: Go to add quakc
                } label: {
                    Text("+")
                        .bold()
                        .frame(width: 60, height: 60)
                        .background{
                            RoundedRectangle(cornerRadius: 40, style: .continuous)
                                .foregroundColor(Color.yellow)
                        }
                        .foregroundColor(.white)
                        .font(.system(size : 40))
                        .multilineTextAlignment(.center)
                }
                .padding(20)
            }
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Quacker")
    }
        
        
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataManager())
    }
}
