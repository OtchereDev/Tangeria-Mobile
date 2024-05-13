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
    @Published var showError: Bool = false
    @Published var authMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isNavigating: Bool = false
    
    func resetPassword()  {
        guard email.isValidEmail() else{
            authMessage = "Provide a valid email"
            showError = true
            return
        }
        
        isLoading = true
        Task{
            do{
                try await AuthenticationManager.shared.resetPassword(email: email)
                isNavigating = true
            }catch{
              
            }
        }
        
        isLoading = false
        
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
                    
                }) {
                    if viewModel.isLoading{
                        ProgressView()
                    }else{
                        Text("RESET PASSWORD")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:"#eea734"))
                            .cornerRadius(10)
                    }
                    
                }.alert(isPresented: $viewModel.showError) {
                    Alert(title: Text("Error"), message: Text(viewModel.authMessage), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                
                NavigationLink(destination: ResetSent(email: viewModel.email).navigationBarBackButtonHidden(false).navigationTitle("Forgot Password"), isActive: $viewModel.isNavigating) {
                                EmptyView()
                        }
            }
            .padding()
           
        }
    }
}

#Preview {
    ForgotPassword()
}
