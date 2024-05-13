//
//  Signup.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI

@MainActor
final class SignupViewModel: ObservableObject{
    @Published var showError: Bool = false
    @Published var authMessage: String = ""
    @Published var isLoading: Bool = false
    @Published  var email: String = ""
    @Published  var password: String = ""

    
    func createUser()  {
        guard email.isValidEmail() else{
            authMessage = "Provide a valid email"
            showError = true
            return
        }
        
        guard !password.isEmpty, password.isStrongPassword() else{
            authMessage = "Provide a strong password"
            showError = true
            return
        }
        
        isLoading = true
        Task{
            do{
                try await AuthenticationManager.shared.createUser(email: email, password: password)
                return
            }catch{
            }
        }
        
        isLoading = false
        
    }
    
    func signInGoogle() async throws{
        let helper   = SignInGoogleHelper()
        let tokens  = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        
    }
}

struct Signup: View {
    @StateObject var viewModel =  SignupViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Create Account")
                    .font(.custom("Poppins-Regular", size: 40))
                    .padding(.top, 5)
                   
                
                Text("Enter your Name, Email and Password for sign up. ")
                    .foregroundColor(.gray)
                + Text("Already have account?")
                   
                    .foregroundColor(.orange)
                Spacer().frame(height: 10)
                
                TextField("EMAIL ADDRESS", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("PASSWORD", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {
                    viewModel.createUser()
                }) {
                  
                    if viewModel.isLoading{
                        ProgressView()
                    }else{
                        Text("SIGN UP")
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
                
                Text("By Signing up you agree to our Terms Conditions & Privacy Policy.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text("Or")
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
    
                Button(action: {
                    Task{
                        do{
                            try await viewModel.signInGoogle()
                        }catch{
                            print("error \(error)")
                        }
                    }
                }) {
                    HStack {
                        Image("google")
                            .foregroundColor(.white)
                        Text("CONNECT WITH GOOGLE")
                           
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color(hex:"#395998"))
                    .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
            
        }
    }
}


#Preview {
    Signup()
}
