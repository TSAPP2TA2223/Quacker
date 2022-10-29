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
    var type: Binding<Int>?
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

struct CameraView: UIViewControllerRepresentable{
    var type: Binding<Int>?
    func makeUIViewController(context: Context) -> some UIViewController {
        let cam = UIImagePickerController()
        cam.sourceType = .camera
        cam.delegate = context.coordinator
        return cam
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}
//MARK: - Coordinator Class
class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
    }
}
