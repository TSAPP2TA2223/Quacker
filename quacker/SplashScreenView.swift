//
//  SplashScreenView.swift
//  quacker
//
//  Created by Iker Rero Martínez on 29/10/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            Color.yellow
            if isActive{
                //Archivo al que va
                SignUpView()
            } else {
                
                VStack{
                    LottieView()
                        .frame(width: 250, height: 250, alignment: .center)
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }.ignoresSafeArea()
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
}
