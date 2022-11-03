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
    @State private var path = [String]()
    @State private var currentUserEmail: String?
    var body: some View {
        NavigationStack(path: $path){
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
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            path.append("AddQuack")
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
                    CustomTabBar(selectedTab: $selectedTab)
                }
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Quacker")
                .navigationDestination(for: String.self, destination: { string in
                    if string == "User"{
                        ProfileView()
                            .environmentObject(dataManager)
                    } else if string == "AddQuack" {
                        AddQuackView()
                    } else {
                        MainView()
                            .environmentObject(dataManager)
                    }
                })
            }
        }
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataManager())
    }
}
