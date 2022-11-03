//
//  DataManager.swift
//  quacker
//
//  Created by Abby Dominguez on 30/10/22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var quacks: [Quack] = []
    let semaphore = DispatchSemaphore(value: 1)
    
    init() {
        fetchQuacks()
    }
    
    func fetchQuacks(){
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
                    let content = data["contents"] as? String ?? ""
                    
                    let quack = Quack(owner: owner, contents: content)
                    self.quacks.append(quack)
                    
                }
            }
        }
    }
    
}
//docRef.getDocument { snapshot, error in
//
//}
