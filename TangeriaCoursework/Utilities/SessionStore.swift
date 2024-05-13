//
//  SessionStore.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 13/05/2024.
//

import Foundation
//import SwiftUI
//import Firebase
//import Combine
//
//class AuthUser {
//    var uid: String
//    var email: String?
//    var displayName: String?
//
//    init(uid: String, displayName: String?, email: String?) {
//        self.uid = uid
//        self.email = email
//        self.displayName = displayName
//    }
//
//}
//
//
//class SessionStore : ObservableObject {
//    var didChange = PassthroughSubject<SessionStore, Never>()
//    var session: AuthUser? { didSet { self.didChange.send(self) }}
//    var handle: AuthStateDidChangeListenerHandle?
//
//    func listen () {
//        // monitor authentication changes using firebase
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            if let user = user {
//                self.session = AuthUser(
//                    uid: user.uid,
//                    displayName: user.displayName,
//                    email: user.email
//                )
//            } else {
//                // if we don't have a user, set our session to nil
//                self.session = nil
//            }
//        }
//    }
//
//    func unbind () {
//           if let handle = handle {
//               Auth.auth().removeStateDidChangeListener(handle)
//           }
//       }
//    
//}
