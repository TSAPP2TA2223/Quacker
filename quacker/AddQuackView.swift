//
//  AddQuackView.swift
//  quacker
//
//  Created by Abby Dominguez on 30/10/22.
//

import SwiftUI
import Firebase

struct AddQuackView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var content = ""
    @State private var userImage = UIImage(systemName: "person.crop.circle.fill")!
    
    //TODO: Build a decent fucking UI lol
    
    
    var body: some View {
        VStack{
            Image(uiImage: userImage)
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundColor(.white)
                .clipShape(Circle())
            TextField("Quack", text: $content)
            Button {
                if content != "" {
                    sendQuack(quackContents: content, quackOwner: (Auth.auth().currentUser?.email)!)
                    content = ""
                }
            } label: {
                Text("Send")
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
        .onAppear(perform: fetchImage)
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
   

struct AddQuackView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuackView()
            .environmentObject(DataManager())
    }
}
func sendQuack(quackContents: String, quackOwner: String){
    let db = Firestore.firestore()
    let newQuack = Quack(owner: quackOwner, contents: quackContents)
    
    let ref = db.collection("Quacks").document(newQuack.id.description)
    ref.setData(["contents": newQuack.contents, "id" : newQuack.id.description, "owner": newQuack.owner]) { error in
        //TODO: error management
    }
}
