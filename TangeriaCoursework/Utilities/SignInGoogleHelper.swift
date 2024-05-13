//
//  SignInGoogleHelper.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel {
    let idToken : String
    let accessToken : String
}


final class SignInGoogleHelper {
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignedResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidSignedResult.user.idToken?.tokenString else {
            throw URLError(.cannotFindHost)
        }
        let accessToken: String = gidSignedResult.user.accessToken.tokenString
        
        let tokens =  GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        return tokens
    }
    
}
