//
//  ProfileView.swift
//  quacker
//
//  Created by Abby Dominguez on 2/11/22.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var dataManager : DataManager
    @State private var currentUserEmail = Auth.auth().currentUser?.email ?? "@user"
    @State private var userImage = UIImage(systemName: "person.crop.circle.fill")!
    @State private var fullName = "Full Name"
    @State private var userBio = "@user bio"
    @State private var quacks = [Quack]()
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(uiImage: userImage)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    .onAppear(perform: fetchImg)
                
                Spacer()
            }
            
            Text(fullName)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .onAppear(perform: fetchFullName)
            Text(currentUserEmail)
                .font(.system(size: 18))
            Text(userBio)
                .font(.system(size:12))
                .onAppear(perform: fetchBio)
        }.padding(20)
        VStack{
            List(quacks, id: \.id) { quack in
                HStack {
                    Image(systemName: "photo")
                    VStack(alignment: .leading) {
                        Text(quack.owner)
                        Text(quack.contents)
                            .font(.subheadline)
                    }
                }
            }
        }.onAppear(perform: fetchQuacksFromUser)
    }
    func fetchBio(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserProfiles").document(Auth.auth().currentUser!.email!)
        docRef.getDocument { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                let data = snapshot.data()
                let userbio = data?["bio"] as? String ?? ""
                userBio = userbio
            }
        }
    }
    func fetchFullName(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserProfiles").document(Auth.auth().currentUser!.email!)
        docRef.getDocument { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                let data = snapshot.data()
                let fullname = data?["fullName"] as? String ?? ""
                fullName = fullname
            }
        }
    }
    func fetchImg(){
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
    func fetchQuacksFromUser(){
        quacks.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Quacks")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let owner = data["owner"] as? String ?? ""
                    if (owner == currentUserEmail){
                        let content = data["contents"] as? String ?? ""
                        let quack = Quack(owner: owner, contents: content)
                        self.quacks.append(quack)
                    }
                    
                }
            }
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DataManager())
            
    }
}
