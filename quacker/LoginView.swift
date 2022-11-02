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
    @State private var path = [String]()
    
    @StateObject var dataManager = DataManager()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
        try? Auth.auth().signOut()
    }
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geo in
                ZStack{
                    Color("ColorBackground")
                    VStack{
                        TextField("Username", text: $email)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 40)
                            .autocorrectionDisabled(false)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 50)
                            .autocorrectionDisabled(true)
                        
                        Button {
                            login()
                        
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
                            path.append("register")
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
            .navigationDestination(for: String.self, destination: { string in
                if string == "register" {
                    SignUpView()
                } else {
                    MainView()
                        .environmentObject(dataManager)
                }
            })
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                path.append(Auth.auth().currentUser!.email!)
            }
        }
           
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
