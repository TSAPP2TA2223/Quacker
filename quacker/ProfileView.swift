//
//  ProfileView.swift
//  quacker
//
//  Created by Abby Dominguez on 2/11/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var dataManager : DataManager
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    
                Spacer()
            }
            Text("Full name")
                .fontWeight(.bold)
                .font(.system(size: 25))
            Text("@username")
                .font(.system(size: 18))
            Text("Biography of the user, text might be a little bit longer woo")
                .font(.system(size:12))
        }.padding(20)
        VStack{
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DataManager())
    }
}
