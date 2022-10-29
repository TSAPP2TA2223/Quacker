//
//  ImagePicker.swift
//  quacker
//
//  Created by Abby Dominguez on 29/10/22.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    @Binding var selectedImage: UIImage
    @Binding var showImagePicker: Bool
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> PhotoLibraryCoordinator {
        return Coordinator(parent: self)
    }
}
struct ImagePickerCamera: UIViewControllerRepresentable{
    @Binding var selectedImage: UIImage
    @Binding var showImagePicker: Bool
    func makeUIViewController(context: Context) -> some UIViewController {
        let cam = UIImagePickerController()
        cam.sourceType = .camera
        cam.delegate = context.coordinator
        return cam
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> CameraCoordinator {
        return Coordinator(parent: self)
    }
}
//MARK: - Coordinator Classes
class PhotoLibraryCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var parent: ImagePicker
    init(parent:  ImagePicker){
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            DispatchQueue.main.async {
                self.parent.selectedImage = image
                self.parent.showImagePicker = false
            }
        }
    }
}
class CameraCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var parent: ImagePickerCamera
    init(parent:  ImagePickerCamera){
        self.parent = parent
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            DispatchQueue.main.async {
                self.parent.selectedImage = image
                self.parent.showImagePicker = false
            }
        }
    }
}

