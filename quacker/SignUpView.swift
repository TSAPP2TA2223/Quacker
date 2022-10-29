//
//  SignUpView.swift
//  quacker
//
//  Created by Abby Dominguez on 29/10/22.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemYellow]
    }
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    @State var selectedImage: UIImage = UIImage(systemName: "person.crop.circle.fill")!
    
    @State private var showDialogue: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: Int = 0
    
    var body: some View {
        NavigationView {
            GeometryReader {geo in
                ZStack {
                    Color.blue
                    VStack(spacing: 20){
                        
                        Image(uiImage: selectedImage)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            
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
                            register()
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
                        ImagePickerCamera(selectedImage: $selectedImage, showImagePicker: $showImagePicker)
                    } else {
                        ImagePicker(selectedImage: $selectedImage, showImagePicker: $showImagePicker)
                    }
                }
            }
            .navigationTitle("Sign up")
            
        }
        
        
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
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
