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
    var body: some View {
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
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
