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
    
    func fetchQuacks(){
        //TODO: Fetch all the quacks
    }
}
