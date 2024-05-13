//
//  ResetSent.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI

@MainActor
final class ResetPasswordViewModel: ObservableObject{
    @Published var showError: Bool = false
    @Published var authMessage: String = ""
    @Published var messageTittle: String = "Error"
    @Published var isLoading: Bool = false
    
    func resetPassword(email: String)  {
        guard email.isValidEmail() else{
            authMessage = "Provide a valid email"
            showError = true
            return
        }
        
        isLoading = true
        Task{
            do{
                try await AuthenticationManager.shared.resetPassword(email: email)
                messageTittle = "Success"
                authMessage = "We have successfully resent you the reset email"
                showError = true
                return

            }catch{
              
            }
        }
        
        isLoading = false
        
    }
}

struct ResetSent: View {
    
    let email: String
    @StateObject private var viewModel = ResetPasswordViewModel()

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reset email sent")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("We have sent an instructions email to ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("\(email) ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("Having problem?")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                Button(action: {
                    viewModel.resetPassword(email: email)
                               }) {
                                   if viewModel.isLoading{
                                       ProgressView()
                                   }else{
                                       Text("SEND AGAIN")
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
                
                
                              Image("resetsent")
                                  .resizable()
                                  .frame(width: 306, height: 237)
                                  
                Spacer()
            }
            .padding()
            
        }
    }
}


#Preview {
    ResetSent(email:"Oliver@gmail.com")
}
