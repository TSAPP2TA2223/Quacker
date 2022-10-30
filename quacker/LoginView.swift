//
//  LoginView.swift
//  quacker
//
//  Created by Diego Moreno on 29/10/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    Color.blue
                    VStack{
                        TextField("Username", text: $email)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                            .autocorrectionDisabled(false)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 50)
                            .autocorrectionDisabled(true)
                        
                        Button {
                            login()
                            if userIsLoggedIn == true {
                                print("it is logged in woo")c
                            }
                            
                        } label: {
                            Text("Quack in")
                                .bold()
                                .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                                .background{
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .foregroundColor(Color.yellow)
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
                .ignoresSafeArea()
            }
            .navigationTitle("Login")
            .onAppear{
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

