//
//  ProfileView.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack{
            Group{
               
                Button(action: {
                    Task {
                        do{
                           try AuthenticationManager.shared.signOut()
                        }catch{
                            print("Error \(error)")
                        }
                    }
                    

                }){
                    Text("Sign Out")
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
