//
//  MainView.swift
//  quacker
//
//  Created by Diego Moreno on 30/10/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var userName = ""
    @State private var quack = ""
    @State private var pfpUser = ""
    
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            HStack {
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text("Username")
                    Text("Quack")
                        .font(.subheadline)
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
