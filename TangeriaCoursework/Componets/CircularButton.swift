////
////  CircularButton.swift
////  TangeriaCoursework
////
////  Created by Bismark Amo on 13/05/2024.
////
//
//import SwiftUI
//
//struct CircularButton<Content: View>: View {
//    let action: () -> Void
//    let content: Content
//    var price: String
//    @Binding var selected: String?
//    
//    init(action: @escaping () -> Void, @ViewBuilder content: () -> Content, price: () -> String) {
//        self.action = action
//        self.content = content()
//        self.price = price()
//    }
//    
//    var body: some View {
//        Button(action: {
//          
//        }) {
//            content
//                .padding()
//                .background(Color.blue)
//                .clipShape(Circle())
//        }
//    }
//}
//
//
//
