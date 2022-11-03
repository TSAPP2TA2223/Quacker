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
    @State private var currentView: String = "main"
    @State private var userImage = UIImage(systemName: "person.crop.circle.fill")!
    var body: some View {
        switch(currentView){
        case "main":
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
                            .onChange(of: selectedTab, perform: { newValue in
                                if selectedTab == Tabs.chat{
                                   currentView = "messages"
                                }
                                if selectedTab == Tabs.notifications{
                                    
                                }
                                if selectedTab == Tabs.discover{
                                    currentView = "discovery"
                                }
                                if selectedTab == Tabs.notifications{
                                    currentView = "notification"
                                }
                            })
                            
                    }
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarLeading){
                            Button{
                                //side menu
                                path.append("User")
                            } label: {
                                Image(uiImage: userImage)
                                    .resizable()
                                    .onAppear(perform: fetchImage)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .padding(10)
                                //Label("Profile", systemImage:"person.circle.fill")
                            }
                        }
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
        case "discovery":
            DiscoveryView()
        case "messages":
            MessagesView()
        case "notification":
            NotificationView()
        default:
            MainView()
                .environmentObject(dataManager)
            
        }
       
    }
    
    func fetchImage(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserProfiles").document(Auth.auth().currentUser!.email!)
        docRef.getDocument { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                let data = snapshot.data()
                let img = data?["profilePicture"] as? String ?? ""
                print(img)
                userImage = convertBase64ToImage(imageString: img)
            }
        }
    }
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString,
                             options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataManager())
    }
}
