//
//  CNContact+Extensions.swift
//  UI-Crash-Representable
//
//  Created by Matt Harrington on 3/29/22.
//

import SwiftUI
import Contacts
import ContactsUI

struct CNContactViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = CNContactViewController
    var contact: CNContact
    
//    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> CNContactViewController {
        let viewController = CNContactViewController(forNewContact: contact)
        viewController.delegate = context.coordinator
        viewController.allowsEditing = true
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(vc: self)
    }
    
    func updateUIViewController(_ uiViewController: CNContactViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, CNContactViewControllerDelegate {
        var vc: CNContactViewControllerRepresentable
        
        init(vc: CNContactViewControllerRepresentable) {
            self.vc = vc
        }
        
        func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
            viewController.dismiss(animated: true)
        }
    }
}
