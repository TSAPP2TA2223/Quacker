//
//  DetailView.swift
//  quacker
//
//  Created by Diego Moreno on 2/11/22.
//

import SwiftUI
import Firebase

struct DetailView: View {
    @State var uid: String
    @State private var contents: String = ""
    @State private var profileName: String = ""
    @State private var quackOwner: String = ""
    @State private var ownerFullName: String = ""
    @State private var userImage = UIImage(systemName: "person.crop.circle.fill")!
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: userImage)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(quackOwner)
                    Text(ownerFullName)
                }
                Spacer()
            }
            .padding(30)
           
            Text(contents)
                .onAppear(perform: fetchQuackID)
                .padding()
                .padding(10)
            Spacer()
        }
    }
    func fetchQuackID(){
        print(uid)
        let db = Firestore.firestore()
        let docRef = db.collection("Quacks").document(uid)
        docRef.getDocument { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot{
                let data = snapshot.data()
                let owner = data?["owner"] as? String ?? ""
                let content = data?["contents"] as? String ?? ""
                
                let quack = Quack(owner: owner, contents: content)
                
                contents = quack.contents
                quackOwner = quack.owner
                fetchOwnerData()
                
            }
            
        }
    }
    func fetchOwnerData(){
        let db = Firestore.firestore()
        let docRef = db.collection("UserProfiles").document(quackOwner)
        docRef.getDocument { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot{
                let data = snapshot.data()
                let img = data?["profilePicture"] as? String ?? ""
                let fullName = data?["fullName"] as? String ?? ""
                userImage = convertBase64ToImage(imageString: img)
                ownerFullName = fullName
            }
        }
    }
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString,
                             options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
}
