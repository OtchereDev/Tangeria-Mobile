//
//  SignIn.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI
import FirebaseAuth


@MainActor
final class SignInEmailViewModel: ObservableObject{
    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isSigningIn: Bool = false
    @Published var showAlert: Bool = false

    
    private let emailRegex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive)

    
    func signIn(){
        guard isValidEmail(email), isValidPassword(password) else{
            errorMessage = "Please enter a valid email and password."
            showAlert = true
            return
        }
        
        isSigningIn = true
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.signInUser(email: self.email, password: self.password)
                print("Successfully Logged in")
            }catch let authError as NSError{
                let errorCode = authError.code
                if (errorCode > 0){
                    switch errorCode {
                    case AuthErrorCode.wrongPassword.rawValue:
                        errorMessage = "Invalid Credentials"
                    case AuthErrorCode.invalidCredential.rawValue:
                        errorMessage = "Invalid Credentials"
                    default:
                        errorMessage = "Invalid Credentials"
                    }
                }else{
                    errorMessage = "Error: \(authError)"
                }
                
                showAlert = true
            }
            
        }
        
        isSigningIn = false
        
    }
        
        func signInGoogle() async throws{
            let helper   = SignInGoogleHelper()
            let tokens  = try await helper.signIn()
            try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
            
        }
        
        func isValidEmail(_ email: String) -> Bool {
            let range = NSRange(location: 0, length: email.utf16.count)
            return emailRegex.firstMatch(in: email, options: [], range: range) != nil
        }
        
        func isValidPassword(_ password: String) -> Bool {
            return password.count >= 1
        }
    
}

struct SignIn: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
    @State private var isSignupNavigating = false
    @State private var isForgotNavigating = false
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to Tamang Food Services")
                    .font(.custom("Poppins-Regular", size: 32))
                
                Text("Enter your Phone number or Email address for sign in. Enjoy your food :)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                TextField("EMAIL ADDRESS", text: $viewModel.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("PASSWORD", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.isForgotNavigating = true
                    }) {
                        Text("Forget Password?")
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {
                    viewModel.signIn()
                }) {
                    if viewModel.isSigningIn{
                       ProgressView()
                    }else{
                        Text("SIGN IN")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex:"#eea734"))
                            .cornerRadius(10)
                            .disabled(viewModel.isSigningIn)
                    }
                   
                }.alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    Button(action: {
                        self.isSignupNavigating = true
                    }) {
                        Text("Create new account.")
                            .foregroundColor(Color(hex:"#eea734"))
                    }
                }
                
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
                    // Connect with Facebook action
                }) {
                    HStack {
                        Image("facebook")
                            .foregroundColor(.white)
                        Text("CONNECT WITH FACEBOOK")
                            
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color(hex:"#4385f4"))
                    .cornerRadius(10)
                }
                
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
            
            
          
            NavigationLink(destination: ForgotPassword().navigationBarBackButtonHidden(false).navigationTitle("Forgot Password"), isActive: $isForgotNavigating) {
                            EmptyView()
                    }
            
            NavigationLink(destination: Signup().navigationBarBackButtonHidden(false).navigationTitle("Sign Up"), isActive: $isSignupNavigating) {
                            EmptyView()
                    }
        }
    }
}


#Preview {
    SignIn()
}
