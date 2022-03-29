//
//  ContentView.swift
//  UI-Crash-Representable
//
//  Created by Matt Harrington on 3/29/22.
//

import SwiftUI
import Contacts

struct ContentView: View {
    @State var presented: Bool
    
    var body: some View {
        Button(action: {
            presented = true
        }) {
            Label("", systemImage: "person.crop.circle.badge.plus")
        }
        .sheet(isPresented: $presented) {
            NavigationView() {
                CNContactViewControllerRepresentable(contact: CNContact())
                .navigationBarItems(leading:
                    Button(action: {
                        presented.toggle()
                    }) {
                        Text("Close")
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presented: false)
    }
}
