//
//  ForgotPassword.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI

@MainActor
final class ForgotPasswordViewModel: ObservableObject{
    @Published var email: String = ""
    
    func resetPassword()  {
        guard !email.isEmpty else{
            return
        }
        
        Task{
            do{
                try await AuthenticationManager.shared.resetPassword(email: email)
            }catch{
                print("Error: \(error)")
            }
        }
        
    }
}

struct ForgotPassword: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Forgot password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Enter your email address and we will send you a reset instructions.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 20)
                
                TextField("EMAIL ADDRESS", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                
                
                
                Button(action: {
                    viewModel.resetPassword()
                    print("Password reset")
                }) {
                    Text("RESET PASSWORD")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"#eea734"))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
           
        }
    }
}

#Preview {
    ForgotPassword()
}
