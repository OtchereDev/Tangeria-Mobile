//
//  AuthenticationManager.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

@Observable
final class AuthenticationManager{
    static let shared = AuthenticationManager()
    var currentUser: FirebaseAuth.User?
    
    private init(){
        self.currentUser = Auth.auth().currentUser
    }
    
    
}

extension AuthenticationManager {
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authData = try await Auth.auth().createUser(withEmail: email, password: password)
        
        currentUser = authData.user
        return AuthDataResultModel(user: authData.user)
    }
    

    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func isAuthenticated() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        currentUser = nil
    }
    
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authData = try await Auth.auth().signIn(withEmail: email, password: password)
        currentUser = authData.user
        return AuthDataResultModel(user: authData.user)
    }
    
    func resetPassword(email: String) async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}


extension AuthenticationManager{
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authData =   try await Auth.auth().signIn(with: credential)
        currentUser = authData.user
        return AuthDataResultModel(user: authData.user)
    }
}
