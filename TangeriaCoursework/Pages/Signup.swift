//
//  Signup.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI

struct Signup: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                TextField("FULL NAME", text: $fullName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                TextField("EMAIL ADDRESS", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                SecureField("PASSWORD", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {
                    // Sign in action
                }) {
                    Text("SIGN UP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex:"#eea734"))
                        .cornerRadius(10)
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
                    // Connect with Google action
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
