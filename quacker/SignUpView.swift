//
//  SignUpView.swift
//  quacker
//
//  Created by Abby Dominguez on 29/10/22.
//

import SwiftUI

struct SignUpView: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
    }
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    
    @State private var showDialogue: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: Int = 0
    
    var body: some View {
        NavigationView {
            GeometryReader {geo in
                ZStack {
                    Color.blue
                    VStack(spacing: 20){
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundColor(.white)
                            
                        Button("Add Profile Picture"){
                            self.showDialogue = true
                        }
                        .foregroundColor(.yellow)
                        .confirmationDialog("What", isPresented: $showDialogue) {
                            Button("Camera") {
                                self.showImagePicker = true
                                self.sourceType = 0
                            }
                            Button("Photo Library") {
                                self.showImagePicker = true
                                self.sourceType = 1
                            }
                            Button("Cancel", role: .cancel){}
                        }
                        TextField("Email", text: $email)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 20)
                            .autocorrectionDisabled(true)
                        
                        TextField("Username", text: $username)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 20)
                            .autocorrectionDisabled(true)
                        
                        TextField("Full Name", text: $fullName)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 20)
                            .autocorrectionDisabled(false)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .background(.white)
                            .cornerRadius(20)
                            .frame(width: geo.size.width - (geo.size.width/10), height: 20)
                            .autocorrectionDisabled(true)
                            
                        
                        Button {
                            //TODO: Sign up
                        } label: {
                            Text("Quack up")
                                .bold()
                                .frame(width: geo.size.width - geo.size.width/10, height: 40)
                                .background{
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .foregroundColor(.yellow)
                                }
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                .ignoresSafeArea()
                .sheet(isPresented: $showImagePicker, onDismiss: nil) {
                    if sourceType == 0{
                        CameraView()
                    } else {
                        ImagePicker()
                    }
                }
            }
            .navigationTitle("Sign up")
            
        }
        
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
