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
    
    //TODO: Build a decent fucking UI lol
    
    
    var body: some View {
        VStack{
            TextField("Quack", text: $content)
            
            Button {
                //TODO: Get this check out and use currentUser from the Login View :)
                Auth.auth().signIn(withEmail: "abbytorade@icloud.com", password: "123456") { result, error in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        print("logged in woo")
                        sendQuack(quackContents: content, quackOwner: (Auth.auth().currentUser?.email)!)
                    }
                }
                
            } label: {
                Text("Send")
            }
            .padding()
        }
        
        
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
    let ref = db.collection("Quacks").document(quackContents)
    let newQuack = Quack(owner: quackOwner, contents: quackContents)
    ref.setData(["contents": newQuack.contents, "id" : 10, "owner": newQuack.owner]) { error in
        //TODO: error management
    }
}
