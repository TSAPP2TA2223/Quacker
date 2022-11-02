//
//  DetailView.swift
//  quacker
//
//  Created by Diego Moreno on 2/11/22.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo")
                VStack(alignment: .leading) {
                    Text("Profile name")
                    Text("Email")
                        .font(.subheadline)
                }
            }
            .offset(x: -100, y: -170)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .padding()
                .offset(x: 0, y: -170)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
