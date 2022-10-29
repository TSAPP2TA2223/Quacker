//
//  LoginView.swift
//  quacker
//
//  Created by Diego Moreno on 29/10/22.
//

import SwiftUI
import _AuthenticationServices_SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    Color.blue
                        .ignoresSafeArea()
                    VStack{
                        TextField("Username", text: $username)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                            .autocorrectionDisabled(true)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 50)
                            .autocorrectionDisabled(true)
                        
                        Button {
                            // Login
                        } label: {
                            Text("Quack in")
                                .bold()
                                .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                                .background{
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .foregroundColor(Color("Yellow"))
                                }
                                .foregroundColor(.white)
                        }
                        
                        Button{
                            // Register
                        } label: {
                            Text("Don't have an account?")
                                .bold()
                                .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
