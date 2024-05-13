//
//  ResetSent.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import SwiftUI

struct ResetSent: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reset email sent")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("We have sent an instructions email to ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("sajin tamang@figma.com. ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                + Text("Having problem?")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                Button(action: {
                                   // Sign in action
                               }) {
                                   Text("SEND AGAIN")
                                     
                                       .foregroundColor(.white)
                                       .frame(maxWidth: .infinity)
                                       .padding()
                                       .background(Color(hex:"#eea734"))
                                       .cornerRadius(10)
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
    ResetSent()
}
