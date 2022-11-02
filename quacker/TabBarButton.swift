//
//  TabBarButton.swift
//  quacker
//
//  Created by Diego Moreno on 3/11/22.
//

import SwiftUI

struct TabBarButton: View {
    
    var imageName : String
    var isActive : Bool
    
    var body: some View {
        
        GeometryReader { geo in
            if isActive {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: geo.size.width/2, height: 4)
                    .padding(.leading, geo.size.width/4)
            }
            VStack (alignment: .center, spacing: 4){
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(imageName: "", isActive: true)
    }
}
